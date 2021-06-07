# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def followings
    @title = 'Followings'
    @user  = User.find(params[:id])
    @following_users = @user.followings.page(params[:page])
    render 'show_follow'
  end

  def followers
    @title = 'Followers'
    @user  = User.find(params[:id])
    @follower_users = @user.followers.page(params[:page])
    render 'show_follow'
  end
end
