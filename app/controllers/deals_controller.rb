class DealsController < ApplicationController
  before_action :authenticate_user!

  # current user's all deals
  def index
    @deals = Deal.where(collector_id: current_user.id).or(Deal.where(creator_id: current_user.id)).order("created_at DESC")
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
    @collector = User.find(current_user.id)
    @creator = User.find(@post.user_id)
    if !@post.constraint.nil? && @collector.rating < @post.constraint
      flash[:alert] = "Your credit does not meet the constraint!."
      redirect_to request.referrer
    elsif @collector.id == @post.user_id
      flash[:alert] = "You can't collect your own post!"
      redirect_to request.referrer
    else
      @deal = Deal.new(:creator_id=>@post.user_id, :collector_id=>current_user.id, :post_id=>params[:id], :creator_rating=>false, :collector_rating=>false)
      @deal.save
      # when someone collects the post, the status of is_collected becomes true
      @post.update_attribute(:is_collected, true)

      UserMailer.with(user: @collector, creator: @creator).collector_email.deliver_later
      UserMailer.with(user: @creator, collector: @collector).creator_email.deliver_later
      # redirect_to :action => :show, id: @deal.id
      redirect_to :controller=>'deals', :action => :index
    end
  end
end
