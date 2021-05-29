class ReportsController < ApplicationController
  before_action :set_report, only: %i[edit update destroy]

  def new
    @report = Report.new
  end

  def edit; 
    @report = Report.find(params[:id])
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    @report.save
    redirect_to reports_path
  end

  def index
    @reports = Report.order(:id).page(params[:page])
  end

  def show
    @report = Report.find(params[:id])
  end

  def destroy
    @report.destroy
  end

  def update
    if @report.update(report_params)
      redirect_to @report, notice: t('controllers.common.notice_update', name: Report.model_name.human)
    else
      render :edit
    end
  end

  private
  
  def set_report
    @report = current_user.reports.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :body)
  end
end
