class HomeController < ApplicationController
  def index
    @articles = Admin::Article.all
  end
end
