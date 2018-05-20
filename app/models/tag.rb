class Tag < ApplicationRecord
  validates :name, presence: true
  validates :key_name, presence: true, uniqueness: true
end
