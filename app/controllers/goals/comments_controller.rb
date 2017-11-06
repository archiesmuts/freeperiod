class Goals::CommentsController < CommentsController
  before_action :set_commentable

  private
    def set_commentable
      @commentable = Goal.friendly.find(params[:goal_id])
    end
end
