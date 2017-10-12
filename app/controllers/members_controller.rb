class MembersController < ApplicationController
  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      flash[:notice] = "Member successfully created"
      redirect_to @member
    else
      flash[:error] = 'There was an error saving your information'
      render 'new'
    end
  end

  def show
    @member = Member.find(params[:id])
  end

  def index
    @members = Member.all
  end

  private
  def member_params
    params.require(:member).permit(:name, :website, :short_url, :scraped_content)
  end
end
