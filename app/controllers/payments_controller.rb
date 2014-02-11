class PaymentsController < ApplicationController
  include ActiveMerchant::Billing

  def index
	@credit_card = ActiveMerchant::Billing::CreditCard.new
  end

  def confirm
  end
  def complete
  end
  def checkout
    setup_response = gateway.setup_purchase(5000,
    :ip                => request.remote_ip,
    :return_url        => url_for(:action => 'confirm', :only_path => false),
    :cancel_return_url => url_for(:action => 'index', :only_path => false)
                                            )
    redirect_to gateway.redirect_url_for(setup_response.token)
  end


end
