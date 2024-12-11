class HomeController < ApplicationController
  def index
    @articles = Admin::Article.joins(:content).where(contents: { state: Content.states[:published] })
  end
end
