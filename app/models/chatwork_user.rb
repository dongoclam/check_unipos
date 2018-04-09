class ChatworkUser < ApplicationRecord
  validates :name, presence: true
  validates :account_id, presence: true, uniqueness: true
end
