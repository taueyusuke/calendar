class ConferenceroomsController < ApplicationController
  def new
    @conferenceroom = Conferenceroom.new
  end
  
  def create
    facility = Facility.new
    facility.save
    @conferenceroom = Conferenceroom.new(conferenceroom_params)
    @conferenceroom.facility_id = 1
    if @conferenceroom.save
      flash[:success] = "会議室を登録しました"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def index
    @conferencerooms = Conferenceroom.limit(10).includes(:schedules, :facility).order('created_at DESC')
  end
  
  def show
    @conferenceroom = Conferenceroom.find_by(id: params[:id])
  end
  
  private
    def conferenceroom_params
      params.require(:conferenceroom).permit(:people, :price, :remarks, :starttime, :endtime, :conferenceroomname)
    end
end

