class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:show]
  before_action :new_comment, only: [:index, :show]

  def index
    @comments = Comment.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @new_comment.parent_id = @comment.id
    @comments = @comment.answers.paginate(:page => params[:page], :per_page => 10)
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to redirect_create(@comment)
    else
       redirect_to redirect_create(@comment), :flash => { :error => @comment.errors }
    end

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :parent_id)
    end

    def redirect_create comment
        if (not comment.parent_id.blank?)
          comment_path(@comment.parent_id)
        else
          root_path
        end
    end

    def new_comment
      @new_comment = Comment.new
    end

end
