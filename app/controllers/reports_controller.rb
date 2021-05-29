class ReportsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def new
    @report = Report.new
  end

  def create
    @reoprt = Reoprt.new(reoprt_params)
    @reoprt.user_id = current_user.id
    @reoprt.save
    redirect_to reoprts_path
  end

  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end
end
