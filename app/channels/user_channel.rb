class UserChannel < ApplicationCable::Channel
  def subscribed
    user = User.find(params[:id])
    stream_for user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # def send_invoice_notification(data)
  #   ActionCable.server.broadcast("user_#{current_user.id}_channel", notification: data)
  # end
end
