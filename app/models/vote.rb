class Vote < ActiveRecord::Base
  belongs_to :article, :counter_cache => true

  scope :causing,    -> { where(effect: 'cause') }
  scope :preventing, -> { where(effect: 'prevent') }

  def things
    (general || "").split(/,\s*/).map{ |t| t.downcase }
  end
end
