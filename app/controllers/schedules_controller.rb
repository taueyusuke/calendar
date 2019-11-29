class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
  end
  
  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user_id = current_user.id
    if @schedule.save!
      flash[:success] = "予約を新規作成しました"
      redirect_to root_url
    else 
      render 'new'
    end
  end
  
  def show
    @schedule = Schedule.find(params[:id])
  end
  
  private
    def schedule_params
      params.require(:schedule).permit(:starttime, :endtime, :title, :content).merge(conferenceroom_id: current_user.id)
    end
end
