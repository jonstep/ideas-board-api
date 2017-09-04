class CreateIdeas < ActiveRecord::Migration[4.2]
  def self.up
    create_table :ideas do |t|
      t.string :uuid
      t.string :title
      t.text :body
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :ideas
  end
end
