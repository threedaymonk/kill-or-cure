class ResultsController < ApplicationController
  def index
    @letters = NormalizedTerm.connection.select_all("SELECT DISTINCT LOWER(SUBSTR(value, 1, 1)) AS letter FROM normalized_terms").map{ |r| r["letter"] }.sort
    if params[:page]
      @terms = NormalizedTerm.paginate(
                 :page    => params[:page],
                 :order   => "LOWER(normalized_terms.value) ASC",
                 :include => [:articles])
    else
      @letter = ((params[:letter] || '')[/^./] || 'a').downcase
      @terms =
        NormalizedTerm.where(
          [
            "normalized_terms.value LIKE ? OR normalized_terms.value LIKE ?",
            @letter + "%",
            @letter.upcase + "%"
          ]
        ).
        where(
          "EXISTS (SELECT 1 FROM normalized_taggings
            WHERE normalized_taggings.normalized_term_id = normalized_terms.id
            AND normalized_taggings.votes_against < 3)"
        ).
        order("LOWER(normalized_terms.value) ASC").
        includes(:articles).
        all
    end
  end
end
