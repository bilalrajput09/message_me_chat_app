class MessagesController < ApplicationController
    before_action :require_user
    def create 
        message = current_user.messages.build(messages_params)
        if message.save
            ActionCable.server.broadcast "chatroom_channel", { mod_message: render_message(message) }
        end
    end

    private
    def messages_params 
        params.require(:message).permit(:body)
    end

    def render_message(message)
        render(partial: 'message', locals: { message: message })
    end
end