require 'rubygems'
require 'sinatra'
require 'init'

# Dashboard
get '/' do
    @distribution_servers = DistributionServer.all :order => :name
    @dns_servers = DnsServer.all :order => :name
    @libraries = Library.all :order => :name
    erb :dashboard
end

# Libraries
get '/libraries/new' do
    @library = Library.new
    erb :'libraries/new'
end

put '/libraries/new' do
    @library = Library.new params

    if @library.save
	redirect_to '/'
    else
	# Error
        erb :'libraries/new'
    end

end


helpers do

    def link_to(what) # TODO: pretty much everything
	return '<a href="/libraries/'+what[:id].to_s+'/edit">'+what.name+'</a>'
    end

end
