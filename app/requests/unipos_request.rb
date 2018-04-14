module UniposRequest
  URL = "https://unipos.me/q/jsonrpc"

  def send_request data_body
    uri = URI.parse URL
    https = Net::HTTP.new uri.host, uri.port
    https.use_ssl = true
    request = Net::HTTP::Post.new uri.path
    request["content-type"] = "application/json"
    request["x-unipos-token"] = Setting.x_unipos_token
    request.body = data_body
    response = https.request request

    JSON.parse(response.body)
  end
end
