class AccountsController < ApplicationController
  def index
    @accounts = Account.all.order("created_at DESC")
    respond_to do |format|
      format.html
    end
  end

  def show
    @account = Account.find(params[:id])
    @users = @account.users
    @search = User.search(params[:search])
    respond_to do |format|
      format.html
    end
  end

  def assign_user
    @user = User.find(params[:user])
    @user.account = Account.find(params[:id])
    @user.save
    redirect_to :back
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(allowed_params)
    respond_to do |format|
      if @account.save
        format.html { redirect_to accounts_path, notice: 'Company Account was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def delete_account
    @user = User.find(params[:user_id])
    @user.update_attributes(account_id: nil)
    redirect_to account_path(params[:id])
  end

  private
  def allowed_params
    params.require(:account).permit :name, :description, :email, :telephone, :address
  end
end
