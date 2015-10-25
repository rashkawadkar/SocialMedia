class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all
    @status = Status.new
  end

  def home
    @posts = current_user.statuses.order("created_at desc").page(params[:page]).per(10)
  end

  def buddies
    
  end

  private

  def status_param
    params.require(:status).permit(:message)
  end
  
end
