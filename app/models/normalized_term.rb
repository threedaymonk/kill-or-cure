class NormalizedTerm < ActiveRecord::Base
  has_many :terms
  has_many :normalized_taggings
  has_many :articles,
           :through    => :normalized_taggings

  def uncontroversial_taggings
    normalized_taggings.uncontroversial
  end

  def self.[](value)
    n = find_by_value(value) || create!(:value => value)
  end

  def causes_articles
    uncontroversial_taggings.select{ |t| !t.good? }.map{ |t| t.article }
  end

  def prevents_articles
    uncontroversial_taggings.select{ |t| t.good? }.map{ |t| t.article }
  end

  def causes?
    uncontroversial_taggings.any?{ |t| !t.good? }
  end

  def prevents?
    uncontroversial_taggings.any?{ |t| t.good? }
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
