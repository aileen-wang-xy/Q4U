class DealsController < ApplicationController
  before_action :authenticate_user!

  def index
    @deals = Deal.where(collector_id: current_user.id).order("created_at DESC")
    @posts = Post.all
  end

  def show
    @deal = Deal.find(params[:id])
  end

  def create
    @post = Post.find(params[:id])
    @collector = current_user.id
    @creator = @post.user_id
    @deal = Deal.new(:creator_id=>@post.user_id, :collector_id=>current_user.id, :post_id=>params[:id], :creator_rating=>false, :collector_rating=>false)
    @deal.save
    # when someone collects the post, the status of is_collected becomes true
    @post.update_attribute(:is_collected, true)
    # redirect_to action: 'show', id: @deal.id
    redirect_to :action => :show, id: @deal.id
  end
end
