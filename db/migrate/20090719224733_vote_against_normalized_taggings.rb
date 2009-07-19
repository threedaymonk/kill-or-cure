class VoteAgainstNormalizedTaggings < ActiveRecord::Migration
  def self.up
    add_column "normalized_taggings", "votes_against", :integer, :default => 0
  end

  def self.down
    remove_column "normalized_taggings", "votes_against"
  end
end
