class AddRevisionToDistributionServers < ActiveRecord::Migration
  def self.up
    add_column :distribution_servers, :library_collection_revision, :integer
  end

  def self.down
    remove_column :distribution_servers, :library_collection_revision
  end
end

