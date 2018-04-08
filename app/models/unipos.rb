class Unipos < ApplicationRecord
  belongs_to :sender, class: UniposUser.name
  belongs_to :receiver, class: UniposUser.name
end
