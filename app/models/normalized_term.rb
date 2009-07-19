class NormalizedTerm < ActiveRecord::Base
  has_many :terms
  has_many :normalized_taggings,
           :conditions => ["votes_against < 3"]
  has_many :articles,
           :through    => :normalized_taggings

  def self.[](value)
    n = find_by_value(value) || create!(:value => value)
  end

  def causes_articles
    normalized_taggings.select{ |t| !t.good? }.map{ |t| t.article }
  end

  def prevents_articles
    normalized_taggings.select{ |t| t.good? }.map{ |t| t.article }
  end

  def causes?
    normalized_taggings.any?{ |t| !t.good? }
  end

  def prevents?
    normalized_taggings.any?{ |t| t.good? }
  end

  def effect
    case [!!prevents?, !!causes?]
    when [false, true]
      :cause
    when [true, false]
      :prevent
    when [true, true]
      :both
    end
  end

  def plural?
    value =~ /s$/i
  end
end
