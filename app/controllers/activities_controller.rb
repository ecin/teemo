class ActivitiesController < ApplicationController
  respond_to :json

  def index
    user_id = params[:user_id]

    if user = User.where(:id => user_id).first
      render :json => user.activities, root: false
    else
      render json: Activity.all, root: false
    end
  end

  def search
    query = params[:query]

    render json: Activity.fuzzy_search(query), root: false
  end

end
