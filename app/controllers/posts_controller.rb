class PostsController < ApplicationController
  def index
    @posts = Post.desc(:created_at).page params[:page]
  end

  def show
    @post = Post.find(params[:id])
    @post.comments.build

    @comments = @post.comments.desc(:created_at).page params[:page]
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post criado com sucesso.' }
        # format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        # format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if params[:post][:comment].present?
        comment = Comment.new(post_params[:comment])
        if comment.valid?
          @post.comments.create(post_params[:comment])
          format.html { redirect_to @post, notice: 'Comentário criado com sucesso.' }
          # format.json { render :show, status: :ok, location: @post }
        else
          format.html { redirect_to @post, notice: 'Não foi possível salvar o comentário' }
          # format.json { render json: comment.errors, status: :unprocessable_entity }
        end
      else
        if @post.update(post_params)
          format.html { redirect_to @post, notice: 'Post atualizado com sucesso.' }
          # format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit }
          # format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post apagado com sucesso.' }
      # format.json { head :no_content }
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :page, comment: [:user_name, :content])
    end
end
