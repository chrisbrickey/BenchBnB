class Api::UsersController < ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      #below sends too much info to the front end
      # render json: @user

      # below is the manual way to render a particular file, looks for file named show.___
      # render "api/users/show"
      render :show
      #above looks for a view under this controllers folder ('api' namespace, then 'Users' folder)

    else
      render json: @user.errors.full_messages, status: 422
    end
  end


  #this is probably bypassed by the else section of the create action (above)
  # def show
  #    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
  # end

  private

  def user_params
    params.require(:user).permit(:password, :username)
  end

end
