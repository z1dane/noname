class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.integer :group_id
      t.string  :login
      t.string  :password
      t.string  :name
    end
  end

  def self.down
    drop_table :users
  end
end
