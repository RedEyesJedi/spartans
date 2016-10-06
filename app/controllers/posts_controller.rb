module Admin
  class PostsController < ApplicationController
    before_action :set_label, only: [:edit, :show, :update, :destroy]
    def index
      @posts= Post.all
     end

    def new
      @post= Post.new
    end

    def create
      @post = Post.new(post_params)
      respond_to do |format|
        if @post.save
          format.html { redirect_to [ "admin", @post ], notice: 'Se ha creado el post' }
        else
          format.html { render :new }
        end
      end
    end

    def update
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to [ "admin", @post ], notice: 'Se ha actualizado el post' }
        else
          format.html { render :new }
        end
      end
    end

    def edit
    end

    def show
    end

    def destroy
      respond_to do |format|
        if @post.destroy
          format.html { redirect_to admin_posts_url, notice: "Se ha eliminado el post" }
        else
          format.html { render :index, notice: "Elemento no eliminado" }
        end
      end
    end

    private
      def post_params
        params.require(:post).permit(:titulo,:contenido,:veces_leida)
      end

      def set_post
        @post = Post.find(params[:id])
      end
  end
end
