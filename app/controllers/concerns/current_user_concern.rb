module CurrentUserConcern
  extend ActiveSupport::Concern

  def current_user #in Ruby you can override or overload the method.
    #if current_user is not nil, do nothing
    #else do the OpenStruct thing
    #this is considered null object pattern
    super || guest_user

  end

  def guest_user
    # OpenStruct.new(name: "Guest Hus", 
    #               first_name: "Guest", 
    #               last_nmae: "Hus", 
    #               email: "guest@dfs.com")

    guest = GuestUser.new
    guest.name = "Guestt Hus"
    guest.first_name = "Guestt"
    guest.last_name = "Hus"
    guest.email = "guest@dfs.com"
    guest
  end

end


