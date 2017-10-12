class FriendshipsController < ApplicationController
  include MembersHelper

  def create
    @friendship = Friendship.new(friendship_params)
    if (!@friendship.same_person?(friendship_params[:member_id], friendship_params[:friend_id]) && @friendship.save)
      flash[:notice] = "You are now friends"
      redirect_to new_friend
    else
      flash[:alert] = "Could not connect to member"
      redirect_to new_friend
    end
  end

  private
  def friendship_params
    params.require(:friendship).permit(:member_id, :friend_id)
  end

  def new_friend
    begin
      Member.find(friendship_params[:friend_id])
    rescue
      current_user
    end
  end
end
