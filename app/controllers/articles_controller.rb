class ArticlesController < ApplicationController
    def new 
        @article = Article.new
    end 

    def create 
        # render plain: params[:article].inspect
        @article = Article.new(param_article)
        @article.save
    end

    private def param_article 
        params.require(:article).permit(:title, :description)
    end
end