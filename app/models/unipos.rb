class Unipos < ApplicationRecord
  self.table_name = "uniposes"

  belongs_to :sender, class_name: User.name
  belongs_to :receiver, class_name: User.name

  validates :unipos_id, presence: true, uniqueness: true
  validates :point, presence: true
  validates :message, presence: true
  validates :praise_count, presence: true
  validates :self_praise_count, presence: true

  scope :load_user_with_core_value, ->(start_date, end_date, tag) {
    where(sent_at: start_date..end_date)
    .where("message LIKE ?", "%#{tag}%")
    .group(:receiver_id)
    .order("count_all DESC")
    .limit(Settings.unipos.user.top.limit)
    .count
  }
end
