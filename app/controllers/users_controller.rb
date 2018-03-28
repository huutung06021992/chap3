class UsersController < ApplicationController

  # def index
  #   @users = User.select(:id, :name).page(params[:page]).per Settings.page
  # end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash[:error] = I18n.t("no_find_user")
      redirect_to users_url
    end
  end

  def create
    @user = User.new user_params
    if @user.save
    flash[:success] = I18n.t("welcom")
    redirect_to @user
    else
    flash[:error] = I18n.t("create_user")
    render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
