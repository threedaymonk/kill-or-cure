class CorrectionsController < ApplicationController
  def new
    @backlink = request.env["HTTP_REFERER"] || results_path
    @tagging = NormalizedTagging.find_by_article_id_and_normalized_term_id_and_good(params[:article_id], params[:normalized_term_id], params[:good]=="1")
  end

  def create
    NormalizedTagging.increment_counter(:votes_against, params[:id])
    redirect_to params[:backlink]
  end
end

