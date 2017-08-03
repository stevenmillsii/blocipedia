class ChargesController < ApplicationController

  def create

    @amount = 1500

    customer = Stripe::Customer.create(
      email: current_user.email,
      card:  params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: "Premium Membership",
      currency: 'usd'
    )

    flash[:notice] = "Thanks for upgrading your account!"
    current_user.premium!
    redirect_to root_path

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end

  def downgrade
    if current_user.premium?
      flash[:notice] = "Your account has been downgraded"
      current_user.standard!
    else
      flash[:notice] = "You aren't allowed to downgrade"
    end
    redirect_to :back
  end

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Membership - #{current_user.name}",
      amount: @amount
    }
  end

end
