class LoadUserService
  include UniposRequest

  NAME_REGEX = /[\W]*([\w ]+)[\W]*/

  def initialize name = nil
    @name = valid_name name
  end

  def perform
    send_request(data_body)["result"]
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
