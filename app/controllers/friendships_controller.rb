class FriendshipsController < ApplicationController

  def create
    @friendship = Friendship.new(f_params)
    @friend = Member.find(f_params[:friend_id])
    @befriender = Member.find(f_params[:member_id])
    if (!@friendship.same_person?(@befriender.id, @friend.id) && @friendship.save)
      flash[:notice] = "#{@befriender.name} is now friends with #{@friend.name}"
      redirect_to @befriender
    else
      flash[:alert] = "Could not connect to member"
      redirect_to @befriender
    end
  end

  private
  def f_params
    params.require(:friendship).permit(:member_id, :friend_id)
  end
end
