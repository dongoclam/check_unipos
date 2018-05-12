class ChatworkUser < ApplicationRecord
  validates :name, presence: true
  validates :chatwork_id, presence: true, uniqueness: true

  default_scope {order("checked, created_at DESC")}
  scope :name_like, ->(name){where("lower(name) LIKE '%#{name}%'")}
end
