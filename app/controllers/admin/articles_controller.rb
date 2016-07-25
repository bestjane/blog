module Admin
  class ArticlesController < AdminController
    before_action :find_article, except: [:index, :new, :create]

    def index
      @articles = Article.all.order(id: :desc).page(params[:page]).per(10)
    end

    def new
      @article = Article.new
    end

    def show
    end

    def create
      @article = Article.new(article_param)
      if @article.save
        operate_success
      else
        render 'new', alert: '创建失败'
      end
    end

    def edit
    end

    def update
      if @article.update(article_param)
        operate_success
      else
        render 'index', alert: '删除失败'
      end
    end

    def destroy
      if @article.destroy
        operate_success
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

    def operate_success
      redirect_to admin_articles_path, notice: '操作成功'
    end

  end
end
