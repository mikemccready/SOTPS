class DonationsController < ApplicationController

def new
  @donation = Donation.new
end

  def create
    # Amount in cents
    @amount = 500


    # @post = Post.find(params[:id])
    donation = Donation.create(user: current_user, amount: @amount)
      if donation.valid?
        donation.save
      end
  

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    rescue Stripe::CardError => e
      flash[:error] = e.message
    redirect_to charges_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def donation_params
    #   params.require(:donation).permit(:amount, :user_id)
    # end

end
