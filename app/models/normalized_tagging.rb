class NormalizedTagging < ActiveRecord::Base
  belongs_to :article
  belongs_to :normalized_term
  scope :uncontroversial, -> { where("votes_against < 3") }
end
