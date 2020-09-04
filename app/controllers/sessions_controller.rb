class SessionsController < ApplicationController

  def new

    if logged_in?
      flash[:alert]="You are already logged in !"
      redirect_to user_path(current_user)
    end

  end

  def create

    user=User.find_by(email:params[:session][:email])
    #Nuk e perdorim @user ne kete rast pasi ne nuk duam ta aksesojm @user ne view prandaj
    # e kemi ruajtur ne nje variabel user,thjesht per te ruajur te dhenat ne session
    if user &&  user.authenticate(params[:session][:password])

      session[:user_id]=user.id

      flash[:notice]="Logged in successfully !"

      redirect_to user_path(user)

    else

      flash.now[:alert]="There was something wrong with your login details !!!"
      render 'new'
    end


  end

  def destroy
    session[:user_id] = nil
    flash[:notice]="Logged out !"
    redirect_to login_path
  end

end
