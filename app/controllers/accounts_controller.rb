class AccountsController < ApplicationController

  def show
    @accounts = Account.all
  end

  def barcodelogin
    @account = Account.find_by(studentnumber: params[:barnum])
    @account.update_attribute(:loggedin, true)
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to :root
    end
  end

  def edit
  end

  def update
    account = Account.find(params[:id])
    if account.update_attribute(:loggedin, params[:loggedin])
      redirect_to :root
    else
      redirect_to :root
    end
  end

  def destroy
    Account.find(params[:id]).destroy
    redirect_to :root
  end

  def account_params
      params.require(:account).permit(:studentnumber, :password, :loggedin, :lastlogin)
  end
end
