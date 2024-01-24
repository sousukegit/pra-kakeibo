class ApplicationController < ActionController::Base
    def redirect_to_signin
        #セッションIdが空白ならログインページへ
      redirect_to signin_path if session[:user_id].blank?
    end
end
