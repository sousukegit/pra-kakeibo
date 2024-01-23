class UsersController < ApplicationController
 before_action :redirect_to_signin, only:[:edit,:update]

    def new
        @user = User.new        
    end

    def create
        #取得したパラメーターから新しいインスタンスを作成
        @user = User.new(set_params) 
        #DBから登録があるemailか確認
        user = User.find_by(email: @user.email) 
        if user.present?
            flash.now[:alert] = "すでに登録されているユーザーです"
Rails.logger.debug(flash[:alert])
            render :new
        else
            if @user.save
                flash[:notice] = "ユーザー登録しました"
                #サインインぺージへリダイレクト
                redirect_to signin_path
            else
                flash.now[:alert] = "登録に失敗しました"
                render :new
            end
        end       
        
    end

    def edit
        @user = User.find(session[:user_id])  
    end

    def update
        #一度レコードを取得
        @user = User.find(session[:user_id])  
        user_params = params.require(:user).permit(:name,:email)
        #既存レコードに新しい値を入れてupdate
        if @user.update(user_params)
            flash[:notice] = "ユーザーデータを更新しました"
            redirect_to edit_user_path
        else
            flash.now[:alert] = "更新失敗"
            render :edit
        end     
    end

    private
    def set_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end

end
