class Tagging < ActiveRecord::Base
  belongs_to :article
  belongs_to :term
end
