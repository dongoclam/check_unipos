class Unipos < ApplicationRecord
  self.table_name = "uniposes"

  belongs_to :sender, class_name: User.name
  belongs_to :receiver, class_name: User.name

  validates :unipos_id, presence: true, uniqueness: true
  validates :point, presence: true
  validates :message, presence: true
  validates :praise_count, presence: true
  validates :self_praise_count, presence: true

end
