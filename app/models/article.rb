class Article < ActiveRecord::Base
  has_many :votes
  named_scope :to_do, :order => "articles.votes_count ASC, RANDOM()"
end
