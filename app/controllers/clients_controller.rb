class ClientsController < ApplicationController
  	before_filter :authenticate_user!
  def home
  end

  def copy

  end  

  def complite
  	@orders = current_user.orders.where(:status => 4)
  end

  def wait
  	@orders = current_user.orders.where(:status => 0)
  end

  def work
  	@orders = current_user.orders.where(:status => 2)
  end

  def correct
  	@orders = current_user.orders.where(:status => 1)
  end

  def check
  	@orders = current_user.orders.where(:status => 3)
  end

  def pay
    @credit_card = ActiveMerchant::Billing::CreditCard.new(
    :first_name => 'Steve',
    :last_name  => 'Smith',
    :month      => '9',
    :year       => '2010',
    :type       => 'visa',
    :number     => '4242424242424242'
           )
  end
end