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
    @account = Account.new(params.require(:account).permit(:studentnumber, :password, :password_confirmation))
    if @account.save && @account.password == @account.password_confirmation
      redirect_to :root
    end
  end

  def update
    @account = Account.find(params[:id])
    if @account.update_attributes(params[:account])
      redirect_to :root
    else
      redirect_to :root
    end
  end

  def destroy
    Account.find(params[:id]).destroy
    redirect_to :root
  end
end
