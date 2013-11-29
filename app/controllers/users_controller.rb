class UsersController < ApplicationController
  respond_to :json

  def show
    user_id = params[:id]

    respond_with User.where(:id => user_id).first
  end

end