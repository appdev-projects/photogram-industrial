class UsersController < ApplicationController
  def profile
    username = params.fetch("username")
    @user = User.where(username:"username").first
    render "users/profile"
  end
  def feed
    @feed = User.find(current_user.id).feed
    render "users/feed"
  end
end
