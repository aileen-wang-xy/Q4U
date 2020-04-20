class StaticPagesController < ApplicationController
  def home
    # @request = Post.where(service_type: request).order("created_at DESC").limit(8)
    # @provides = Post.where(service_type: provide).order("created_at DESC").limit(8)
    @posts = Post.all.order("created_at DESC").limit(8)
  end

  def account
  end

end
