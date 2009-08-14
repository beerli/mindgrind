class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :owner
      t.string :shownuser
      t.boolean :visible, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
