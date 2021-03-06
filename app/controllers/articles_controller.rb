class ArticlesController < ApplicationController
    before_action :set_articles, only: [:edit , :update , :show , :destroy]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    # def index
    # #    render :partial => "show"
    # @article = Article.where(knowledge: 'Learning').first
    # end
            def index 
                @articles = Article.paginate(page: params[:page], per_page: 5)
            end
            def show
                    # render plain: @article.title
                end
            def new
                @article = Article.new
            end
            def edit
                @article =Article.find(params[:id])
            end
                def update
                    if @article.update(article_params)
                    flash[:success]="Article is successfully updates"
                    redirect_to articles_path(@article)
                    else
                        render 'edit'
                end
            end
            def destroy
                 @article.destroy
                 flash[:danger]="Article is fully deleted"
                 redirect_to articles_path
            end
            def create
                @article = Article.new(article_params)
                @article.user = current_user
                if @article.save
                    #do something
                    flash[:success] ="Article is successfully created"
                    redirect_to articles_path(@article)
                else
                    render 'new'
                end
            end 
            private
            def set_articles
                @article = Article.find(params[:id])
            end
            def require_same_user
                if current_user != @article.user and !current_user.admin?
                    flash[:danger] = "you can only edit or delete your own article"
                    redirect_to root_path
                end
            end
            private 
            def article_params
                params.require(:article).permit(:title, :description)
            end
 end