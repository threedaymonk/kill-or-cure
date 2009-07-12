class StatsController < ApplicationController
  def index
    @articles = Article.most_voted.paginate(:page => params[:page], :include => :votes)
  end
end
