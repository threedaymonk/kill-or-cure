class Vote < ActiveRecord::Base
  belongs_to :article, :counter_cache => true

  scope :causing,    :conditions => "votes.effect = 'cause'"
  scope :preventing, :conditions => "votes.effect = 'prevent'"

  def things
    (general || "").split(/,\s*/).map{ |t| t.downcase }
  end
end
