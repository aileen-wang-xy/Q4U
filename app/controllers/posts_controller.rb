
class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :createDeal]
  before_action :authenticate_user!, only: [:new, :create]
  # GET /posts
  # GET /posts.json
  def index
    if session[:search_query].blank?
      @posts = Post.all.order("created_at DESC").page(params[:page])

    else
      st = "%#{session[:search_query]}%"
      @posts = Post.where("spot_name like ?", st).order("created_at DESC").page(params[:page])
    end
    @requests = Post.where(service_type: 'request').order("created_at DESC").page(params[:page_1]).per(5)
    @provides = Post.where(service_type: 'provide').order("created_at DESC").page(params[:page_2]).per(5)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # POST /search
  def search
    if params[:search].blank?
      session.delete(:search_query)
      # @posts = Post.all.order("created_at DESC").page(params[:page])
      redirect_to request.referrer
    else
      # @posts = Post.where("spot_name like ?", st).order("created_at DESC").page(params[:page])
      session[:search_query] = params[:search]
      redirect_to request.referrer
    end
  end

  # GET users/:current_user.id/posts
  def myposts
    @waiting_posts = Post.where(user_id: current_user.id, is_collected: false).order("created_at DESC").page(params[:page])
    @dealt_posts = Post.where(user_id: current_user.id, is_collected: true).order("created_at DESC").page(params[:page])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    #-------add current_user to user_id-----------
    @post.user_id = current_user.id
    #---------------------------------------------
    
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

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:user_id, :service_type, :spot_name, :address, :fee, :start_time, :end_time, :description, :contact_name, :contactno, :contact_email, :constraint)
    end
end
