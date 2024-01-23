class SessionController < ApplicationController
    before_action :redirect_to_books, only:[:new,:create]

    def new      
    end

    def create
        #メールアドレスからuserを取得
        user = User.find_by(email: params[:email]) 
        #present?で存在確認
        #user.authenticateでハッシュ化されたパスワードとおなじか確認
        if user.present? && user.authenticate(params[:password]) 
            #成功したときの処理　
            flash[:notice]="ログイン成功しました"
            #セッションIDにユーザーIdを格納
            session[:user_id] = user.id
            redirect_to books_path
        else
            flash.now[:alert]="ログインできません"
            render :new
        end
    end

    def destroy
      session[:user_id] = nil
      redirect_to signin_path
    end

    private

    def redirect_to_books
        #セッション情報にユーザーIDが存在していたら自動でログイン
        redirect_to books_path if session[:user_id].present?
    end
   
end
