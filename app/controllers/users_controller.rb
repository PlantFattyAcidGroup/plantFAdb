class UsersController < ApplicationController
  load_and_authorize_resource
  
  # GET /users
  def index
    @users = @users.page params[:page]
    if(params[:query])
      @users = @users.where('
        email LIKE ?',
        "%#{params[:query]}%"
      )
    end
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    if @user.save
      redirect_to @user, notice: 'New user created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(resource_params)
      if @user == current_user
        sign_in @user, :bypass => true
      end
      redirect_to @user, notice: 'Account has been updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def resource_params
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      params.require(:user).permit(:email, :password, :password_confirmation, :role)
    end
end
