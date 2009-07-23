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
      @terms = NormalizedTerm.all(
                 :conditions => ["normalized_terms.value LIKE ? OR normalized_terms.value LIKE ?", @letter + "%", @letter.upcase + "%"],
                 :order   => "LOWER(normalized_terms.value) ASC",
                 :include => [:articles])
    end
  end
end
