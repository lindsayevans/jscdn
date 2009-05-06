require 'rubygems'
require 'sinatra'
require 'init'

get '/' do
    @distribution_servers = DistributionServer.all :order => :name
    @dns_servers = DnsServer.all :order => :name
    @libraries = Library.all :order => :name
    erb :dashboard
end


helpers do

    def link_to(what)
	return '<a href="/libraries/'+what[:id].to_s+'/edit">'+what.name+'</a>'
    end

end
