class ArticlesController < ApplicationController
	before_action :set_article, only: [:edit, :update, :show, :destroy]

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def edit
		#@article = Article.find(params[:id])
	end

	def create
		#render plain: params[:article].inspect
		@article = Article.new(article_params)
		if @article.save
			flash[:notice] = "Article was succesfully created!!!"
			redirect_to article_path(@article)
		else
			#redirect_to new_article_path
			render 'new'
		end
	end

	def update
		#@article = Article.find(params[:id])
		if @article.update(article_params)
			flash[:notice] = "Article was succesfully updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	def show
		#@article = Article.find(params[:id])
	end

	def destroy
		#@article = Article.find(params[:id])
		@article.destroy
		flash[:notice] = "Article was succesfully deleted! Well done!"
		redirect_to articles_path
	end

	private
	def article_params
		params.require(:article).permit(:title, :description)
	end

	def set_article
		@article = Article.find(params[:id])
	end
end