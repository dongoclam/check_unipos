class Supports::DashboardsSupport
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
end
