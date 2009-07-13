class Article < ActiveRecord::Base
  has_many :votes

  named_scope :to_do, :order => "articles.votes_count ASC, RANDOM()"
  named_scope :most_voted, :order => "articles.votes_count DESC"

  def causes
    votes.select{ |v| v.effect == "cause" }.map{ |v| v.things }.flatten.sort.uniq
  end

  def preventors
    votes.select{ |v| v.effect = "prevent" }.map{ |v| v.things }.flatten.sort.uniq
  end
end
