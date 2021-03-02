class Api::CommentsController < Api::BaseController
    def index
        all_comments = Comment.all
        render json: all_comments.to_json
    end

    def show
        comment = Comment.find_by(id: params[:id])
        render json: comment.to_json
    end
end