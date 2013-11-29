class ActivitiesController < ApplicationController
  respond_to :json

  def index
    user_id = params[:user_id]

    if user = User.where(:id => user_id).first
      render :json => user.activities
    else
      render :json => Activity.all
    end
  end

end
