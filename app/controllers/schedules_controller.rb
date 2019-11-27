class SchedulesController < ApplicationController
  def new
    @Schedule = Schedule.new
    @conferenceroom = Conferenceroom.find_by(id: params[:conferenceroom_id])
  end
  
  def create
    @Schedule = Schedule.new(schedule_params)
    if @Schedule.save!
      flash[:success] = "予約を新規作成しました"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  private
    def schedule_params
      params.require(:schedule).permit(:starttime, :endtime, :title, :content).merge(user_id: current_user.id)
    end
end
