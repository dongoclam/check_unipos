class Admin::UniposUsersController < AdminController
  before_action :load_chatwork_users

  NAME_REGEX = /[\W]*([\w ]+)[\W]*/
  URL = "https://unipos.me/q/jsonrpc"

  def create
    @chatwork_users.each do |name|
      load_user_from_unipos(name).each do |user|
        user.save
      end
    end
  end

  private

  def load_user_from_unipos name
    uri = URI.parse URL
    https = Net::HTTP.new uri.host, uri.port
    https.use_ssl = true
    request = Net::HTTP::Post.new uri.path
    request["content-type"] = "application/json"
    request["x-unipos-token"] = ENV["X_UNIPOS_TOKEN"]
    request.body = data_header_load_user_by_name name
    response = https.request request
    users = JSON.parse(response.body)["result"]

    users.map! do |user|
      UniposUser.new name: user["display_name"], unipos_name: user["uname"],
        avatar: user["picture_url"], unipos_id: user["id"] }
    end
  end

  def load_chBaseControlleratwork_users
    @chatwork_users = ChatworkUser.all.pluck(:name).map do |name|
      NAME_REGEX.match name
      $1
    end.compact
  end

  def data_header_load_user_by_name name
    {
      jsonrpc: "2.0",
      method: "Unipos.FindSuggestMembers",
      params: {
        term: name,
        limit: 30
      },
      id: "Unipos.FindSuggestMembers"
    }.to_json
  end

end
