class UsersController < ApplicationController
  before_action :logged_in_user, except: %i(new show create)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: :destroy
  before_action :find_user, except: %i(index new create)

  def index
    @users = User.page params[:page]
  end

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new user_params
    if @user.save
    log_in @user
    flash[:success] = t "welcom"
    redirect_to @user
    else
    flash[:error] = t "create_user"
    render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "profile_update"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = t "user_delete"
    redirect_to users_url
  end

  def verify_user
    @user = User.find_by id: params[:id]
    redirect_to home_url unless @user.current_user? current_user
  end

  def current_user? user
    user=current_user
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "login_please"
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to home_url unless current_user? @user
  end

  def admin_user
    redirect_to home_url unless current_user.admin?
  end

  def find_user
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash[:error] = t "no_find_user"
      redirect_to users_url
    end
  end
end
