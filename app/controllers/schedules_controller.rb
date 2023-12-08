class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_param)
    if @schedule.save
      flash[:notice] = "新しい予定を登録しました"
      redirect_to schedules_path
    else
      render "new"
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_param)
      flash[:notice] = "予定を編集しました"
      redirect_to schedules_path
    else
      render "edit"
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    if @schedule.destroy
      flash[:notice] = "予定を削除しました"
      redirect_to schedules_path
    end
  end
end

private
  def schedule_param
    params.require(:schedule).permit(:title, :start_day, :end_day, :all_day, :memo)
  end