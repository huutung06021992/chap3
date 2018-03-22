class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(index edit update)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: :destroy
  before_action :find_user, only: %i(show edit update destroy correct_user)

  def index
    @users = User.where(activated: FILL_IN).paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def show
    find_user
    redirect_to home_url and return unless FILL_IN
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t "alert_email"
      redirect_to home_url
    else
    flash[:error] = t "create_user"
    render :new
    end
  end

  def edit
    find_user
  end

  def update
    find_user
    if @user.update_attributes user_params
      flash[:success] = t "profile_update"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    find_user.destroy
    flash[:success] = "User deleted"
    redirect_to users_url
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
      find_user
      redirect_to root_url unless current_user? @user
    end

    def admin_user
      redirect_to root_url unless current_user.admin?
    end

    def find_user
      @user = User.find_by id: params[:id]
    end
end
