class LoadUserService
  URL = "https://unipos.me/q/jsonrpc"
  NAME_REGEX = /[\W]*([\w ]+)[\W]*/

  def initialize name = nil
    @name = valid_name name
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

    JSON.parse(response.body)["result"]
  end

  private

  def data_body
    {
      jsonrpc: "2.0",
      method: "Unipos.FindSuggestMembers",
      params: {
        term: @name,
        limit: Settings.unipos.request.limit
      },
      id: "Unipos.FindSuggestMembers"
    }.to_json
  end

  def valid_name name
    NAME_REGEX.match name
    $1
  end
end
