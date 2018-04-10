class Admin::UniposUsersController < AdminController
  before_action :load_chatwork_users, only: :load_users_from_unipos
  before_action :load_user, only: %i(show destroy)

  NAME_REGEX = /[\W]*([\w ]+)[\W]*/
  BASE_NAME_REGEX = /([a-z ]+[a-z]{2,})/i
  URL = "https://unipos.me/q/jsonrpc"

  def index
    @users = UniposUser.all.page(params[:page]).per Settings.paginate.per_page
  end

  def show
    render json: @user
  end

  def destroy
    if @user.destroy
      user_name = BASE_NAME_REGEX.match(@user.name).to_a.first
      chatwork_users = ChatworkUser.where("lower(name) LIKE '%#{user_name}%'")
      chatwork_users.each do |chatwork_user|
        chatwork_user.update_attributes checked: false
      end
    end
  end

  def load_users_from_unipos
    @chatwork_users.each do |chatwork_user|
      next unless users = load_new_users(chatwork_user.name)
      chatwork_user.update_attributes checked: true
      users.each do |user|
        user.save
      end
    end
  end

  private

  def load_new_users name
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
    @chatwork_users = ChatworkUser.not_checked
  end

  def data_header_load_user_by_name name
    {
      jsonrpc: "2.0",
      method: "Unipos.FindSuggestMembers",
      params: {
        term: name_for_search(name),
        limit: 30
      },
      id: "Unipos.FindSuggestMembers"
    }.to_json
  end

  def name_for_search name
    NAME_REGEX.match name
    $1
  end

  def load_user
    @user = UniposUser.find_by id: params[:id]
  end
end
