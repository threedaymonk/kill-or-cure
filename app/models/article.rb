class Article < ActiveRecord::Base
  has_many :votes

  named_scope :to_do, :order => "articles.votes_count ASC, RANDOM()"
  named_scope :most_voted, :order => "articles.votes_count DESC"

  def causes
    votes.causing.map{ |v| v.things }.flatten.sort.uniq
  end

  def preventors
    votes.preventing.map{ |v| v.things }.flatten.sort.uniq
  end
end
