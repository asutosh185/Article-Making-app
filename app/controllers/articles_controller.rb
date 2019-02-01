class ArticlesController < ApplicationController
    # def index
    # #    render :partial => "show"
    # @article = Article.where(knowledge: 'Learning').first
    # end
            def index 
                @article = Article.all
            end
            def show
                    @article = Article.find(params[:id])
                    # render plain: @article.title
                end
            def new
                @article = Article.new
            end
            def edit
                @article =Article.find(params[:id])
            end
                def update
                    @article = Article.find(params[:id])
                    if @article.update(article_params)
                    flash[:notice]="Article is successfully updates"
                    redirect_to articles_path(@article)
                    else
                        render 'edit'
                end
            end
            def destroy
                 @article =Article.find(params[:id])
                 @article.destroy
                 flash[:notice]="Article is fully deleted"
                 redirect_to articles_path
            end
            def create
                
                @article = Article.new(article_params)
                
                if @article.save
                    #do something
                    flash[:notice] ="Article is successfully created"
                    redirect_to articles_path(@article)
                else
                    render 'new'
                end
            end 
                
            private 
            def article_params
                params.require(:article).permit(:title, :description)
            end
 end