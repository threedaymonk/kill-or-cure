class Vote < ActiveRecord::Base
  belongs_to :article, :counter_cache => true

  named_scope :causing,    :conditions => "votes.effect = 'cause'"
  named_scope :preventing, :conditions => "votes.effect = 'prevent'"

  def things
    (general || "").split(/,\s*/).map{ |t| t.downcase }
  end
end
