class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast("chatroom_channel", { message: message_body(message) })
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def message_body(data)
    render(partial: "message", locals: { message: data })
  end
end
