class Term < ActiveRecord::Base
  belongs_to :normalized_term
  has_many :taggings
  has_many :articles, :through => :taggings

  def self.[](value)
    n = find_by_value(value) || create!(:value => value)
  end
end
