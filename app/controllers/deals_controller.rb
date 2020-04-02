class DealsController < ApplicationController
  before_action :authenticate_user!

  # current user's all deals
  def index
    @deals = Deal.where(collector_id: current_user.id).order("created_at DESC")
    @posts = Post.all
    @users = User.all
  end
  
  def show
    @deal = Deal.find(params[:id])
    @creator = User.find(@deal.creator_id)
    @collector = User.find(@deal.collector_id)
  end

  def create
    @post = Post.find(params[:id])
    # @collector = current_user.id
    # @creator = @post.user_id
    @collector = User.find(current_user.id)
    @creator = User.find(@post.user_id)
    if @collector.rating < @post.constraint
      # redirect_to post_url(@post), alert: "Watch it, mister!"
      # format.html { redirect_to @post, notice: 'Post was successfully created.' }
      redirect_to @post , notice: 'Your credit does not meet the constraint!.'
    elsif @collector.id == @post.user_id
      redirect_to @post , notice: "You can't collect your own post!"
    else
      @deal = Deal.new(:creator_id=>@post.user_id, :collector_id=>current_user.id, :post_id=>params[:id], :creator_rating=>false, :collector_rating=>false)
      @deal.save
      # when someone collects the post, the status of is_collected becomes true
      @post.update_attribute(:is_collected, true)
      # redirect_to action: 'show', id: @deal.id
      redirect_to :action => :show, id: @deal.id
    end
  end
end
