class ResultsController < ApplicationController
  def index
    @terms = NormalizedTerm.paginate(
               :page    => params[:page],
               :order   => "LOWER(normalized_terms.value) ASC",
               :include => [:articles])
  end
end
