class User < ApplicationRecord
  has_many :sent_uniposes, class_name: Unipos.name, foreign_key: :sender_id, dependent: :destroy
  has_many :received_uniposes, class_name: Unipos.name, foreign_key: :receiver_id, dependent: :destroy
  has_many :receivers, through: :sent_uniposes, source: :receiver
  has_many :senders, through: :received_uniposes, source: :sender

  validates :name, presence: true
  validates :unipos_id, presence: true, uniqueness: true

  default_scope {order("created_at DESC")}
  scope :search_by_name, ->(name){where("lower(name) LIKE '%#{name}%'")}
  scope :no_email, ->{where(email: nil)}
end
