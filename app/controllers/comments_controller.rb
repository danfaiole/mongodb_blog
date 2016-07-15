class CommentsController < ApplicationController

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update(comment_params)
        post = Post.find_by(id: @comment.post_id)
        format.html { redirect_to post, notice: 'Comment atualizado com sucesso.' }
        # format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        # format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    post = Post.find_by(id: @comment.post_id)
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to post, notice: 'Comment apagado com sucesso.' }
      # format.json { head :no_content }
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:user_name, :content)
    end
end
