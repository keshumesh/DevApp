class UsersController < ApplicationController
  include BCrypt
  
 before_action :logged_in_user, only: [:index, :show, :destroy] 
 before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
     @users = User.all 	
  end

  def show
     
  end

  def new
     @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render "new"
    end
  end
 

  def edit
    
  end

  def update
    
 
  respond_to do |format|
    if @user.update_attributes(user_params)
      format.html  { redirect_to(@user,
                    :notice => 'User was successfully updated.') }
      format.json  { head :no_content }
    else
      format.html  { render :action => "edit" }
      format.json  { render :json => @user.errors,
                    :status => :unprocessable_entity }
    end
  end
  end

  def destroy
   @user.destroy
 
    respond_to do |format|
    	format.html { redirect_to users_url }
    	format.json { head :no_content }
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :phone, :password, :gender, :dob, :address)
    end
   
    def find_user
      @user = User.find(params[:id])
    end

    

  

end
