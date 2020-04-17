class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /reviews
  # GET /reviews.json
  # all reviews of current user
  def index
    @user = User.find(params[:id])
    @reviews = Review.where(be_reviewed_id: @user.id).order("created_at DESC")
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @reviewer = User.find(@review.reviewer_id)
    @be_reviewed_user = User.find(@review.be_reviewed_id)
  end

  # GET /reviews/new
  def new
    @review = Review.new
    #-------save deal_id into session-----------
    session[:review_deal_id] = params[:deal_id]
    #---------------------------------------------
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @deal = Deal.find(session[:review_deal_id])
    @review.deal_id = @deal.id
    if current_user.id == @deal.creator_id
      @review.be_reviewed_id = @deal.collector_id
    else
      @review.be_reviewed_id = @deal.creator_id
    end
    @review.reviewer_id = current_user.id

    respond_to do |format|
      if @review.save
        # update the rating status to make sure each user in a deal can review only once
        if current_user.id == @deal.creator_id
          @deal.update_attribute(:creator_rating, true)
        else 
          @deal.update_attribute(:collector_rating, true)
        end 
        # update the credit of the user be reviewed
        @be_reviewed_user_reviews = Review.where(be_reviewed_id: @review.be_reviewed_id)
        @avg_rating = @be_reviewed_user_reviews.average(:rating).round(1)
        @be_reviewed_user = User.find(@review.be_reviewed_id)
        @be_reviewed_user.update_attribute(:rating, @avg_rating)
        # redirect_to deals_path
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:reviewer_id, :be_reviewed_id, :deal_id, :rating, :comment)
    end
end
