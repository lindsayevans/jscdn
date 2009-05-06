class CreateLibraryVersions < ActiveRecord::Migration
  def self.up
    create_table :library_versions do |t|
       t.integer :major_version
       t.integer :minor_version
       t.integer :incremental_version
       t.boolean :is_latest, :default => true
       t.string :original_file, :null => false
       t.datetime :created_at
       t.datetime :modified_at
    end
  end

  def self.down
    drop_table :library_versions
  end
end



