class CreateLibraries < ActiveRecord::Migration
  def self.up
    create_table :libraries do |t|
       t.string :name, :null => false
	t.string :url, :null => false
	t.string :url_template, :null => false
	t.datetime :created_at
	t.datetime :modified_at
    end
  end

  def self.down
    drop_table :libraries
  end
end


