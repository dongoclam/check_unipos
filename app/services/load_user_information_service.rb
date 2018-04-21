class LoadUserInformationService
  include UniposRequest

  def initialize user
    @user = user
  end

  def perform
    send_request(data_body)["member"]
  end

  private

  def data_body
    {
      jsonrpc: "2.0",
      method: "Unipos.GetMemberDetail",
      params: {
        member_id: @user.unipos_id
      },
      id: "Unipos.GetMemberDetail"
    }.to_json
  end
end
