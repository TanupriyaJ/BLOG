class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "tanupriya", password: "secret", except: [:index, :show]

	before_action :set_value, only: [:show,:edit]

   def index
    	@articles = Article.all
   end

   def show
		@article = Article.find(params[:id])	
   end

   def new
		@article = Article.new
   end

   def edit
   		@article = Article.find(params[:id])
   end

   def update
   		@article = Article.find(params[:id])
   		if @article.update(article_params)
   			redirect_to @article
   		else 
   			render 'edit'
   		end
   	end			

   def create
    	@article = Article.new(article_params)
 
    	if @article.save
    	redirect_to @article
    else render 'new'
    end
   end

   def destroy
   		@article =Article.find(params[:id])
   		@article.destroy
   		redirect_to articles_path
   	end	
   
private
  def set_value
  	@article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title, :text, :image)
  end
end
