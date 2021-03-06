class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :title
      t.text :body
      t.integer :owner
      t.string :shownuser
      t.boolean :visible, :default => true
      t.integer :post_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
