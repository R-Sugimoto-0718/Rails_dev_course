class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:edit, :update, :show, :destroy]

    def index
        @articles = Article.all
    end
    
    def new
        @article = Article.new
    end

    def edit
    end

    def create
        @article = Article.new(article_params)
        @article.user = User.first
        if @article.save
            flash[:success] = "Article was successfully created"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def update
        if @article.update(article_params)
            flash[:success] = "Article was seccessfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    def show
    end

    def destroy
        @article.destroy
        flash[:danger] = "Article seccessfully deleted"
        redirect_to articles_path
    end

    private
    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end
end