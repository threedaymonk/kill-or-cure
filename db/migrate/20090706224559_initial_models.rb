class InitialModels < ActiveRecord::Migration
  def self.up
    create_table "articles" do |t|
      t.text "link"
      t.text "title"
      t.text "summary"
      t.integer "votes_count", :default => 0
      t.timestamps
    end

    create_table "votes" do |t|
      t.integer :article_id
      t.text "general"
      t.text "specific"
      t.string "effect"
      t.string "ip"
      t.timestamps
    end
  end

  def self.down
    drop_table "votes"
    drop_table "articles"
  end
end
