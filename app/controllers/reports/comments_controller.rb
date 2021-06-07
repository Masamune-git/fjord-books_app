# frozen_string_literal: true

class Reports::CommentsController < ApplicationController
  def create
    report = Report.find(params[:report_id])
    comment = report.comments.build(comment_params)
    comment.user = current_user

    if comment.save
      redirect_to report_path(report)
    else
      redirect_to report_path(report), alert: 'コメントを入力してください'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
