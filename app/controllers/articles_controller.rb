class ArticlesController < ApplicationController

before_action  :set_article , only: [:show,:edit,:update,:destroy]




  def show



  end

  def index
    @articles = Article.all
  end

  def new

    @article=Article.new

  end

  def edit



  end


  def update

    if @article.update(set_params)
      flash[:notice]="Article updated succesfully !"
      redirect_to @article

    else
      render 'edit'

    end

  end




  def create
    @article = Article.new(set_params)
    if @article.save

      flash[:notice]="Article created succesfully !"

      redirect_to @article
    else
      render 'new'
    end
  end

  def destroy


      if @article.destroy
        flash[:notice]="Article deleted succesfully !"
        redirect_to articles_path
      end


  end

  private

  def set_article
    @article=Article.find(params[:id])

  end

  def set_params

    params.require(:article).permit(:title, :description)

  end


end
