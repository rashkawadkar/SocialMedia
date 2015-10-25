class StatusesController < ApplicationController

  def new
  end

  def create
    @status = current_user.statuses.new(status_param)

    respond_to do |format|
      if @status.save
        format.html { redirect_to users_path, notice: 'Status Updated' }
      else
        format.html { redirect_to users_path, alert: "Something went wrong!" }
      end
    end
  end

  private

  def status_param
    params.require(:status).permit(:message)
  end

end