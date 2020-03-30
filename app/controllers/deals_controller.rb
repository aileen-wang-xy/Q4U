class DealsController < ApplicationController
  before_action :authenticate_user!

  def show
    @deal = Deal.find(params[:id])
  end

  def create
    @post = Post.find(params[:id])
    @collector = current_user.id
    @creator = @post.user_id
    @deal = Deal.new(:creator_id=>@post.user_id, :collector_id=>current_user.id, :post_id=>params[:id], :creator_rating=>false, :collector_rating=>false)
    @deal.save
    # @deal = @post.comments.create(params[:deal].permit(:creator, :collector, :creator_rating, :collector_rating, :post_id))
    # redirect_to action: 'show', id: @deal.id
    redirect_to :action => :show, id: @deal.id
  end
end
