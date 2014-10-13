class CustomersController < ApplicationController
  def start
	@cs=Customer.all			
  end	

  def add_customer
  	@c=Customer.new
  end

  def change
  	@c=Customer.find(params[:format])
  end

  def cust_change
  	@c=Customer.find(params[:format])
  	@c.update(cparams)
  	redirect_to customers_start_path(@c)
  end

  def cust_save
  	@c=Customer.new(cparams)
  	@c.save
    redirect_to customers_start_path
  end

  def cust_delete
  	@c = Customer.find(params[:format])
  	@c.destroy
  	redirect_to customers_start_path
  end

  private
  def cparams
  	params.require(:customer).permit(:c_name,:address,:mobile)
  end
end
