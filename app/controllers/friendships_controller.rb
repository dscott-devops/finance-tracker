class FriendshipsController < ApplicationController
  def destroy
    friend = Friendship.where(user_id: current_user.id,friend_id: params[:id] ).first
    friend.destroy
    flash[:notice] = "Friend was successfully removed from portfolio"
    redirect_to friends_path
  end
end
