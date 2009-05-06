class AddLibraryToVersions < ActiveRecord::Migration
  def self.up
    add_column :library_versions, :library_id, :integer
  end

  def self.down
    delete_column :library_versions, :library_id
  end
end

