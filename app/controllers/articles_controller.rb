class ArticlesController < ApplicationController

    def index 
        @articles = Article.all
    end
    def new 
        @article = Article.new
    end 

    def create 
        # render plain: params[:article].inspect
        @article = Article.new(param_article)
       if @article.save 
        flash[:notice] = "article was successfully created"
        redirect_to article_path(@article)
       else 
        render 'new'
       end
    end 
     
    def show 
        @article = Article.find(params[:id])
    end 
    def edit 
        @article = Article.find(params[:id]) 
    end 

    def update  
         @article = Article.find(params[:id]) 
         if @article.update(param_article) 
            flash[:notice] = "article sucessfully updated."  
            redirect_to article_path(@article)
         else 
            render 'edit'
         end
        
    end

    private def param_article 
        params.require(:article).permit(:title, :description)
    end
end