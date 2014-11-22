class ChargesController < ApplicationController
  before_action :authenticate_user!
  def new
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Collabopedia Membership - #{current_user.name}",
     #amount: Amount.default
     amount: 15_00
   }
  end

  def create
    # Creates a Stripe Customer object, for associating
   # with the charge
   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )
 
   # Where the real magic happens
   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     #amount: Amount.default,
     amount: 15_00, 
     description: "Collabopedia Membership - #{current_user.email}",
     currency: 'usd'
    )
    
   
 
   flash[:success] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
   current_user.update_attributes(paid: true)
   redirect_to user_session_path(current_user.name) # or wherever
 
 # Stripe will send back CardErrors, with friendly messages
 # when something goes wrong.
 # This `rescue block` catches and displays those errors.
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

 #class Amount 

#  def default 
#    default = current_user.charge(15_00) 
#  end  
end
 
