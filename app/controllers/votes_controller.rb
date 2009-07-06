class VotesController < ApplicationController
  def new
    @article = Article.to_do.first
    @vote = @article.votes.build
  end

  def create
    Vote.create!(params[:vote])
    redirect_to new_vote_path
  end
end
