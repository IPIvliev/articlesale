class PaymentsController < ApplicationController

def index
end

def cancel
end

def error

end

# Confirmation step is the actual step that sends money.
def confirm
response = gateway.create_profile(999, params[:token], :reference => "34")
if !response.success?
@message = purchase.message
render :action => 'error'
return
end
end
# The checkout method used to pass the values to paypal. The description is shown to the user in their paypal account.
def checkout
setup_response = gateway.setup_agreement("Monthly subscription fee $9.99 USD",
:return_url => url_for(:action => 'confirm', :only_path => false),
:cancel_return_url => url_for(:action => 'index', :only_path => false)
)
redirect_to gateway.redirect_url_for(setup_response.token)
end
private
#Here's the gateway info.
def gateway
@gateway ||= PaypalExpressRecurringNvGateway.new(
:login => 'Seller_232323455_biz_api1@site.com',
:password => 'W32RW53TE64Y7',
:signature => 'A90EWQRLSDA0SA.SAD0FASWEQ4ls0sl20S0SLD0.223.w'
)
end


end
