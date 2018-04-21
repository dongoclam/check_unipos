module UniposRequest
  def send_request data_body
    uri = URI.parse Setting.unipos_url
    https = Net::HTTP.new uri.host, uri.port
    https.use_ssl = true
    request = Net::HTTP::Post.new uri.path
    request["content-type"] = "application/json"
    request["x-unipos-token"] = Setting.x_unipos_token
    request.body = data_body

    data = begin
            response = https.request request
            JSON.parse(response.body)
           rescue Exception
             nil
           end

    if data && data["result"]
      data["result"]
    else
      Array.new
    end
  end
end
