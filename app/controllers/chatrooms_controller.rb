class ChatroomsController < ApplicationController
  before_action :require_user

  def index
    @message = Message.new
    @user = User.all
    @messages = Message.custom_display
  end
end
