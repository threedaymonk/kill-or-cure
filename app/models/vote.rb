class Vote < ActiveRecord::Base
  belongs_to :article, :counter_cache => true
end
