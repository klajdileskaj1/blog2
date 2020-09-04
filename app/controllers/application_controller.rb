class ApplicationController < ActionController::Base

  helper_method :current_user , :logged_in?

  def current_user

     #Instruksioni me poshte quhet "memoization"
     @current_user ||= User.find( session[:user_id] )  if session[:user_id]
     #Rreshti me siper perkthehet si @current_user = @current_user || @current_user = User.find(session[:user_id])
     #Arsyeja qe behet ai instruksion eshte per te ulur kohen e aksesit te metodes
     #pasi kjo metode per cdo thirrje te saj do te beje nje akses ne database prandaj
     #ajo do te kontrolloj ne fillim ne @current_user ekziston dhe ne te kundert do te beje
     # query ne database
    end

    def logged_in?

      !!current_user

    end

    def require_user

      if !logged_in?
        flash[:alert]="You must be logged in to perform that action"
        redirect_to login_path
      end

    end

end
