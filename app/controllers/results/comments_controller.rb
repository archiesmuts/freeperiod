class Results::CommentsController < CommentsController
  before_action :set_commentable

  private
    def set_commentable
      @commentable = Result.find(params[:result_id])
    end
end
