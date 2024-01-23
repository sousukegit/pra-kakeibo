class UsersController < ApplicationController

    def new
        @user = User.new        
    end

    def create
        #持ってきたパラメーターから新しいインスタンスを作成
        @user = User.new(set_params) 

        if @user.save
            flash[:notice] = "ユーザー登録しました"
            #サインインぺージへリダイレクト
            redirect_to signin_path
        else
            flash.now[:alart] = "登録に失敗しました"
            render :new
        end
        
    end

    private
    def set_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end

end
