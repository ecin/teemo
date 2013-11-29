class AlliesController < ApplicationController
  respond_to :json

  def index
    user_id = params[:user_id]
    activity_id = params[:activity_id]

    user = User.where(:id => user_id).first
    activity = Activity.where(:id => activity_id).first
    allies = user.try(:allies).where(activity_id: activity.try(:id))

    render json: allies, each_serializer: Ally::Serializer, root: false
  end

end
