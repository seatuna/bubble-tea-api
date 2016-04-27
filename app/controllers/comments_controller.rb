class CommentsController < OpenReadController
  before_action :set_comment, only: [:update, :destroy]

  def index
    @comments = Comment.all
    render json: @comments
  end

  # GET /comments/1
  def show
    @comment = Comment.find(params[:id]);
    render json: @comment
  end

  # POST /comments
  def create

    @comment = Drink.find(params[:drink_id]).comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    @comment.update(comment_params)
    if @comment.valid?
      head :no_content
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    if @comment.destroyed?
      head :no_content
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

    def set_comment
      @comment = current_user.comments.find(params[:id])
    end

    def comment_params
      params.require(:comments).permit(:comment)
    end
end
