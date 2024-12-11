class HomeController < ApplicationController
  def index
    @articles = Article.joins(:content).where(contents: { state: :published })
  end
end
