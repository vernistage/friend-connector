class FriendshipsController < ApplicationController
  include MembersHelper

  def create
    @friendship = Friendship.new(friendship_params)
    @befriender = Member.find(friendship_params[:member_id])
    if (!@friendship.same_person?(friendship_params[:member_id], friendship_params[:friend_id]) && @friendship.save)
      flash[:notice] = "You are now friends"
      redirect_to @befriender
    else
      flash[:alert] = "Could not connect to member"
      redirect_to @befriender
    end
  end

  private
  def friendship_params
    params.require(:friendship).permit(:member_id, :friend_id)
  end
end
