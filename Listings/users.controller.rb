class Admin::UsersController < AdminController
  respond_to :html,:json
  before_action :find_user, except: [:index, :list_user, :destroy_multiple]
  def index
    @users = User.all.order(:last_name)
  end

  def show
    @current_manager = Manager.find_manager(@user.username) unless Rails.env.test?
  end

  def destroy
    unless @user.id == current_user.id
      @user.destroy!
      redirect_to action: :index
    else
      flash[:delete]= "Don't destroy yourself."
    end
  end

  def destroy_multiple
    User.destroy(params[:users])
    redirect_to action: :index
  end

  def list_user
    @users = User.all.order(:last_name)
    render template: "admin/users/list_user.json.rabl"
  end

  private
  def find_user
    @user = User.find params[:id]
    @tools = @user.externaltools
  end
end
