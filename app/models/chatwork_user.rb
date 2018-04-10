class ChatworkUser < ApplicationRecord
  validates :name, presence: true
  validates :chatwork_id, presence: true, uniqueness: true

  default_scope {order("checked, created_at DESC")}
  scope :checked, ->{where(checked: :true)}
  scope :not_checked, ->{where(checked: :false)}
end
