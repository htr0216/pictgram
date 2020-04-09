class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: "登録が完了しました"
    else
      flash.now[:danger]="登録が失敗しました"
      render :new
    end
    
    user = User.find_by(id: params[:id])
    if user && user.authenticate(params[:password])
      log_in user
      redirect_to root_url
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  
  
end
