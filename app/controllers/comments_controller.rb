class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:destroy]
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.commentable, notice: 'Comment was successfully posted.' }
        format.json { render :show, status: :created, location: @comment }
        format.js { }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @commentable = @comment.commentable
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment, :user_id)
    end
end
