class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include DeviseWhitelist
  include SetSource

  def current_user #in Ruby you can override or overload the method.
    #if current_user is not nil, do nothing
    #else do the OpenStruct thing
    super || OpenStruct.new(name: "Guest Hus", first_name: "Guest", last_nmae: "Hus", email: "guest@dfs.com")

  end
end
