class MembersController < ApplicationController
  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    RegistrationService.new(@member).register
    if @member.save
      flash[:notice] = "Member successfully created"
      redirect_to @member
    else
      flash[:alert] = 'There was an error saving your information'
      render 'new'
    end
  end

  def show
    @member = Member.find(params[:id])
  end

  def index
    @members = Member.all
  end

  def member_results
    FriendFinderService.new(params[:user_id], params[:topic])
    render 'member_results'
  end

  private
  def member_params
    params.require(:member).permit(:name, :website, :short_url, :scraped_content)
  end
end
