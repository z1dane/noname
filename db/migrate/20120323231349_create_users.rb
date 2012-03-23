class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string  :login
      t.string  :name
    end
  end

  def self.down
    drop_table :system_settings
  end
end
