class CreateTopquotes < ActiveRecord::Migration
  def self.up
    create_table :topquotes do |t|
      t.text :title

      t.timestamps
    end
  end

  def self.down
    drop_table :topquotes
  end
end
