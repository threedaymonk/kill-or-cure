class VotesController < ApplicationController
  def new
    @article = Article.to_do.first
    @vote = @article.votes.build
  end

  def create
    attributes = {:article_id => params[:vote][:article_id], :general => params[:vote][:general]}
    if params[:prevent]
      attributes[:effect] = "prevent"
    elsif params[:cause]
      attributes[:effect] = "cause"
    else
      attributes[:effect] = "skip"
    end
    if attributes[:effect] == "skip" || attributes[:general].present?
      Vote.create!(attributes)
    end
    redirect_to new_vote_path
  end
end
