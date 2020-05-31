class ArticlesController < ApplicationController
    include ArticlesHelper

    def index
        @articles = Article.all
     end
      

    def show
        @article = Article.find(params[:id])
     end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(
            title: params[:article][:title],
            body: params[:article][:body])
          @article.save
          flash.notice = "New article created!"
          redirect_to article_path(@article)
        
      
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash.notice = "Article Deleted!"
        redirect_to "/articles"

    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        @article.update(article_params)

        flash.notice = "Article '#{@article.title}' Updated!"
      
        redirect_to article_path(@article)
    end
    
 end

