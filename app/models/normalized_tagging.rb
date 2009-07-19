class NormalizedTagging < ActiveRecord::Base
  belongs_to :article
  belongs_to :normalized_term
end
