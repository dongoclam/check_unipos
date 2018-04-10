class LoadUserInformationService
  URL = "https://unipos.me/q/jsonrpc"

  def initialize user
    @user = user
  end

  def perform
    uri = URI.parse URL
    https = Net::HTTP.new uri.host, uri.port
    https.use_ssl = true
    request = Net::HTTP::Post.new uri.path
    request["content-type"] = "application/json"
    request["x-unipos-token"] = ENV["X_UNIPOS_TOKEN"]
    request.body = data_body
    response = https.request request

    JSON.parse(response.body)["result"]["member"]
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
