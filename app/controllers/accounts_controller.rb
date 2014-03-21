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
end
