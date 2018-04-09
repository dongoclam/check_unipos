class Admin::UniposUsersController < AdminController
  before_action :load_chatwork_users, only: :load_users_from_unipos

  NAME_REGEX = /[\W]*([\w ]+)[\W]*/
  URL = "https://unipos.me/q/jsonrpc"

  def index
    @users = UniposUser.all.page(params[:page]).per Settings.paginate.per_page
  end

  def show
    render json: @user
  end

  def destroy
    @user.destroy
  end

  def load_users_from_unipos
    @chatwork_users.each do |name|
      next unless users = load_users_by_name(name)
      users.each do |user|
        user.save
      end
    end
  end

  private

  def load_users_by_name name
    uri = URI.parse URL
    https = Net::HTTP.new uri.host, uri.port
    https.use_ssl = true
    request = Net::HTTP::Post.new uri.path
    request["content-type"] = "application/json"
    request["x-unipos-token"] = ENV["X_UNIPOS_TOKEN"]
    request.body = data_header_load_user_by_name name
    response = https.request request

    return unless users = JSON.parse(response.body)["result"]

    users.map! do |user|
      build_user user
    end
  end

  def build_user user
    UniposUser.new name: user["display_name"], unipos_name: user["uname"],
      avatar: user["picture_url"], unipos_id: user["id"]
  end

  def load_chatwork_users
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

  def load_user
    @user = UniposUser.find_by id: params[:id]
  end
end
