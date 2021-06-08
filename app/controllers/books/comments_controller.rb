# frozen_string_literal: true

class Books::CommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = book.comments.build(comment_params)
    comment.user = current_user

    if comment.save
      redirect_to book_path(book)
    else
      @book = book
      flash.now[:alert] = 'コメントを入力してください'
      render 'books/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
