require "net/http"

class HomeController < ApplicationController
  def index
    # uri = URI("https://api.amplitude.com/httpapi")
    # res = Net::HTTP.post_form(uri,
    #   "api_key": "d62110e06e1088a5a1f6283671dcb9ce",
    #   "event": {"user_properties":{"team_id":"framgia"},"user_id":"363b4f90-5ed3-4709-b711-b530ca2e999d","event_type":"search_cards_by_member","event_properties":{"id":"363b4f90-5ed3-4709-b711-b530ca2e999d","display_name":"Do Ngoc Lam"}}.to_json
    # )
    #
    # uri = URI("https://unipos.me/q/jsonrpc")
    # req = Net::HTTP::Post.new(uri)
    # res = Net::HTTP.post_form(uri,
    #   "jsonrpc": "2.0",
    #   "method": "Unipos.GetMemberDetail",
    #   "params": {"member_id":"363b4f90-5ed3-4709-b711-b530ca2e999d"}.to_json,
    #   "id": "Unipos.GetMemberDetail"
    # )
    # @content = response.body
  end

  def show

  end

end
