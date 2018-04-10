class ChatworkUser < ApplicationRecord
  validates :name, presence: true
  validates :account_id, presence: true, uniqueness: true

  default_scope {order("created_at DESC")}
end
