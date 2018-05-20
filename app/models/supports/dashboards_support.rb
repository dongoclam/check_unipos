class Supports::DashboardsSupport
  attr_accessor :start_date, :end_date

  def initialize start_date, end_date
    @start_date = start_date
    @end_date = end_date
  end

  def sent_time_with_point
    Unipos.select(:id).group(:point).count.invert.to_a
  end

  def top_received
    User.unscoped.where.not(total_received: nil).limit(5).order(total_received: :desc).pluck(:name, :total_received)
  end

  def sent_in_day
    Unipos.group(:sent_at).sum :point
  end

  def sent_and_clapped
    [["Sent", User.sum(:total_sent)], ["Clapped", User.sum(:total_clapped)]]
  end

  def tags
    Tag.select :name, :key_name
  end

  def core_values
    tags.pluck(:name).map do |tag|
      result = Unipos.load_user_with_core_value(start_date, end_date, tag)
      result.keys.each{ |key| result[User.find_by(id: key)] = result.delete(key) }
      [tag, result]
    end.to_h
  end
end
