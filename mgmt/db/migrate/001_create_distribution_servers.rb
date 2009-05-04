class CreateDistributionServers < ActiveRecord::Migration
  def self.up
    create_table :distribution_servers do |t|
       t.string :name, :null => false
	t.string :ip_address, :null => false
	t.string :domain_name, :null => false
	t.string :ssh_key_file
	t.boolean :online, :default => false
	t.string :region, :null => false
    end
  end

  def self.down
    drop_table :distribution_servers
  end
end

