class PostsController < ApplicationController

  def index
    @posts = Post.all.sort_by{|x| x.total_votes}.reverse
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def blastoff
    @posts = Post.all.sort_by{|x| x.total_votes}.reverse
  end  

  def vote
    @post = Post.find(params[:id])
    vote = Vote.create(voteable: @post, user: current_user, vote: params[:vote])
      if vote.valid?
        flash[:notice] = "Your vote was counted."
      else
        flash[:error] = "You can only vote once."
      end
    redirect_to :back    
  end  

    def donate
    # Amount in cents
    @amount = 500


    @post = Post.find(params[:id])
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
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :image, :user_id, :category_id, :post_url)
    end
end
