class UserPresenter
  attr_accessor :user

  delegate :name, :avatar, :unipos_name, :total_sent,:total_received,
    :total_clapped, to: :user

  def initialize user
    @user = user
  end

  def sent_in_each_day
    @user.sent_uniposes.group(:sent_at).sum(:point)
  end

  def received_in_each_day
    @user.received_uniposes.group(:sent_at).sum(:point)
  end

  def clapped_in_each_day
    @user.sent_uniposes.group(:sent_at).sum(:praise_count).merge @user.received_uniposes.group(:sent_at).sum(:praise_count)
  end
end
