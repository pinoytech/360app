class AccountsController < ApplicationController
  def index
    @accounts = Account.all.order("created_at DESC")

    respond_to do |format|
      format.html
    end
  end
end
