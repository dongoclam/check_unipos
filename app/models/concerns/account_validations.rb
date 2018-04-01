module AccountValidations
  extend ActiveSupport::Concern

  VALID_NAME_REGEX  = /\A[\p{L}\s]+\z/
  VALID_EMAIL_REGEX = /\A[\w\-\.]+@[a-z\d\-\.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A[0-9]{10,11}\z/

  included do
    validates :name, presence: true, length: {maximum: Settings.account.name.maximum},
      format: {with: VALID_NAME_REGEX}
    validates :email, presence: true, length: {maximum: Settings.account.email.maximum},
      format: {with: VALID_EMAIL_REGEX}, uniqueness: true
    validates :phone, uniqueness: true, format: {with: VALID_PHONE_REGEX}, allow_blank: true
  end
end
