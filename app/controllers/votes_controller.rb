class VotesController < ApplicationController
  before_filter :redirect_if_complete, :except => [:done]

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

  def done
  end

protected
  def redirect_if_complete
    redirect_to :action => :done if @percent_complete >= 100
  end
end
