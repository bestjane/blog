class ArticlesController < ApplicationController
  before_action :find_article, except: [:index, :new, :create]

  def index
    @articles = Article.all.page(params[:page]).per(10)
  end

  def new
    @article = Article.new
  end

  def show
  end

  def create
    @article = Article.new(article_param)
    if @article.save
      redirect_to articles_path, notice: '创建成功'
    else
      render 'new', alert: '创建失败'
    end
  end

  def edit
  end

  def update
    if @article.update(article_param)
      redirect_to articles_path, notice: '修改成功'
    else
      render 'index', alert: '删除失败'
    end
  end

  def destroy
    if @article.destroy
      redirect_to articles_path, notice: '删除成功'
    else
      render 'index', alert: '删除失败'
    end
  end

  private

  def article_param
    params.required(:article).permit(:title, :content)
  end

  def find_article
    @article = Article.find(params[:id])
  end

end
