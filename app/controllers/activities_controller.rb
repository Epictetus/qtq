class ActivitiesController < ApplicationController
  before_action :exist_user_with_params_user_name?,   only: :index
  def index
    @description = ' / 通知一覧'
    @activities = @user.passive_activities.order(id: :desc).includes(:active_user, :learning).page(params[:page]).per(20)
    @title = "#{@user.name}さんの通知一覧"
  end
end