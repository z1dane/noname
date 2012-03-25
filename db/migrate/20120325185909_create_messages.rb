class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.integer :forum_id
      t.integer :parent_id
      t.integer :topic_id
      t.integer :parent_topic_id
      t.integer :user_id
      t.string  :subject
      t.string  :message
    end
  end

  def self.down
    drop_table :messages
  end
end
