class HomeController < ApplicationController

  def index
    @articles = Article.all.order(id: :desc)
  end

end
