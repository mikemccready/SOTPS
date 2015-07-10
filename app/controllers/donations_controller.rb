class DonationsController < ApplicationController

def new
   @donation = Donation.new
end

  def create
    # Amount in cents
    @amount = 500


    @post = Post.find(params[:post_id])
    @donation = Donation.create(user: current_user, amount: @amount, post_id: @post.id, poster_id: @post.user_id)
      if @donation.valid?
        @donation.save
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def donation_params
      params.require(:donation).permit(:amount, :user_id, :post_id, :poster_id)
    end

end
