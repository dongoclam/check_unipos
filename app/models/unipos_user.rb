class UniposUser < ApplicationRecord
  has_many :uniposes, class_name: Unipos.name, foreign_key: :sender_id, dependent: :destroy
  validates :name, presence: true
  validates :unipos_id, presence: true, uniqueness: true

  default_scope {order("created_at DESC")}
end
