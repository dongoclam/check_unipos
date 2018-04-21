class CloneUniposService
  include UniposRequest

  def initialize user
    @user = user
    @existing_ids = (@user.sent_uniposes + @user.received_uniposes).pluck(:unipos_id)
  end

  def perform
    clone_received_items
    clone_sent_items
    total_sent = @user.sent_uniposes.sum(:point)
    total_received = @user.received_uniposes.sum(:point)
    total_praise = (@user.sent_uniposes + @user.received_uniposes).pluck(:praise_count).sum
    @user.update_attributes total_sent: total_sent, total_received: (total_received + total_praise), total_clapped: total_praise
  end

  [:sent, :received].each do |type|
    define_method "clone_#{type}_items" do
      return unless result = send("load_#{type}_items")
      result.each do |unipos|
        send("build_#{type}_unipos", unipos).save
      end
    end
  end

  private

  def build_user user
    User.new name: user["display_name"], unipos_name: user["uname"],
      avatar: user["picture_url"], unipos_id: user["id"]
  end

  def validate_unipos unipos
    return true if @existing_ids.exclude? unipos["id"]
    return false if update_unipos unipos
  end

  def update_unipos unipos
    unipos_params = {
      message: unipos["message"],
      point: unipos["point"],
      reaction: unipos["reaction"],
      praise_count: unipos["praise_count"],
      self_praise_count: unipos["self_praise_count"]
    }

    Unipos.find_by(unipos_id: unipos["id"]).update_attributes unipos_params
  end

  [:sent, :received].each do |type|
    define_method "load_#{type}_items" do
      send_request(send("data_body_#{type}")).select do |unipos|
        validate_unipos unipos
      end
    end

    define_method "build_#{type}_unipos" do |unipos|
      case type
      when :sent
        sender = @user
        receiver = User.find_by(unipos_id: unipos["to_member"]["id"]) || build_user(unipos["to_member"])
        receiver.save if receiver.new_record?
      when :received
        receiver = @user
        sender = User.find_by(unipos_id: unipos["from_member"]["id"]) || build_user(unipos["from_member"])
        sender.save if sender.new_record?
      end

      sender.sent_uniposes.build receiver: receiver, message: unipos["message"],
        point: unipos["point"], unipos_id: unipos["id"], sent_at: Time.at(unipos["created_at"].to_i/1000).to_date,
        reaction: unipos["reaction"], praise_count: unipos["praise_count"], self_praise_count: unipos["self_praise_count"]
    end

    define_method "data_body_#{type}" do
      id_type = (type == :sent) ? :from_member_id : :to_member_id
      {
        jsonrpc: "2.0",
        method: "Unipos.GetCards2",
        params:
        {
          offset_card_id: "",
          count: Settings.unipos.request.limit,
          id_type => @user.unipos_id
        },
        id: "Unipos.GetCards2"
      }.to_json
    end
  end
end
