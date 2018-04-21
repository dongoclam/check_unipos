class CloneUniposService
  include UniposRequest

  def initialize user
    @user = user
    @existing_ids = (@user.sent_uniposes + @user.received_uniposes).pluck(:unipos_id)
  end

  def perform
    clone_received_items
    clone_sent_items
    @user.reload
    total_sent = @user.sent_uniposes.sum(:point)
    total_received = @user.received_uniposes.sum(:point)
    total_clapped = @user.sent_uniposes.sum(:praise_count) + @user.received_uniposes.sum(:praise_count)
    @user.update_attributes total_sent: total_sent, total_received: (total_received + total_clapped), total_clapped: total_clapped
  end

  [:sent, :received].each do |type|
    define_method "clone_#{type}_items" do
      send_request(send("data_body_#{type}")).each do |unipos|
        if @existing_ids.include? unipos["id"]
          update_unipos unipos
        else
          send("build_#{type}_unipos", unipos).save
        end
      end
    end
  end

  private

  [:sent, :received].each do |type|
    define_method "build_#{type}_unipos" do |unipos|
      if type == :sent
        sender = @user
        receiver = User.find_by(unipos_id: unipos["to_member"]["id"]) || create_user(unipos["to_member"])
      else
        receiver = @user
        sender = User.find_by(unipos_id: unipos["from_member"]["id"]) || create_user(unipos["from_member"])
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

  def create_user user
    User.create name: user["display_name"], unipos_name: user["uname"],
      avatar: user["picture_url"], unipos_id: user["id"]
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
end
