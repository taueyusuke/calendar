class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
  end
  
  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user_id = current_user.id
    if @schedule.save
      flash[:success] = "予約を新規作成しました"
      redirect_to root_url
    else 
      render 'new'
    end
  end
  
  def show
    @schedule = Schedule.find(params[:id])
  end
  
  def edit
    @schedule = Schedule.find_by(id: params[:id])
  end
  
  def index
    if user_signed_in?
      @schedule = Schedule.where(user_id: current_user)
    end
  end
  
  def update
    @schedule = Schedule.find_by(id: params[:id])
    if @schedule.update_attributes(schedule_params)
      redirect_to :root
    else
      render action: :edit
    end
  end
  
  def destroy
    @schedule = Schedule.find_by(id: params[:id])
    if @schedule.destroy
      flash[:notice] = "予約が削除されました"
    else
      flash[:alert] = "予約の削除に失敗しました"
    end
    redirect_to root_path
  end
  
  private
    def schedule_params
      params.require(:schedule).permit(:starttime, :endtime, :title, :content).merge(conferenceroom_id: current_user.id)
    end
end
