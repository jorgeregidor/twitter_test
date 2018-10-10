class CommentsController < ApplicationController
  before_action :set_comment, only: [:show]
  before_action :authenticate_user!

  # GET /comments
  # GET /comments.json
  def index
    @comment = Comment.new
    @comments = Comment.all.order(created_at: :desc)
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
        redirect_to root_path
    else
        render :new 
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end
