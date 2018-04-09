class Unipos < ApplicationRecord
  belongs_to :sender, class_name: UniposUser.name
  belongs_to :receiver, class_name: UniposUser.name
end
