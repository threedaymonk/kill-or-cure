class AddTermTables < ActiveRecord::Migration
  def self.up
    create_table "terms" do |t|
      t.string "value"
      t.integer "normalized_term_id"
    end

    create_table "normalized_terms" do |t|
      t.string "value"
    end

    create_table "taggings" do |t|
      t.integer "term_id"
      t.integer "article_id"
      t.boolean "good"
    end

    create_table "normalized_taggings" do |t|
      t.integer "normalized_term_id"
      t.integer "article_id"
      t.boolean "good"
    end
  end

  def self.down
    drop_table "taggings"
    drop_table "normalized_taggings"
    drop_table "normalized_terms"
    drop_table "terms"
  end
end
