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
    if current_user.premium? || current_user.admin?
      flash[:notice] = "Your account has been downgraded"
      current_user.standard!
      current_user.wikis.where(private: true).update_all(private: false)
    else
      flash[:notice] = "You aren't allowed to downgrade"
    end
    redirect_to :back
  end

  def admin
    if current_user.premium?
      flash[:notice] = "You're now an admin"
      current_user.admin!
    elsif current_user.admin?
      flash[:notice] = "You're already an admin!"
    else
      flash[:notice] = "You're not allowed to become an admin! Must be a premium user to upgrade!"
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
