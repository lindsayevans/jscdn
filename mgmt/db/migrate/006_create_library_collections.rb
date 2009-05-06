class CreateLibraryCollections < ActiveRecord::Migration
  def self.up
    create_table :library_collections do |t|
       t.integer :revision, :null => false
       t.string :directory, :null => false
       t.datetime :created_at
       t.datetime :modified_at
    end
  end

  def self.down
    drop_table :library_collections
  end
end



