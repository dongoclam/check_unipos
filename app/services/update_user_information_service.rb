class UpdateUserInformationService
  def initialize user
    @user = user
  end

  def perform
    return unless information = LoadUserInformationService.new(@user).perform
    @user.update_attributes email: information["email_address"]
  end
end
