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

# Server status page
get '/status' do
    @distribution_servers = DistributionServer.all :order => :name
    @dns_servers = DnsServer.all :order => :name
    erb :status
end

# Libraries
get '/libraries/new' do
    @library = Library.new
    erb :'libraries/new'
end

put '/libraries' do
    @library = Library.new params[:library]

    if @library.save
	redirect '/'
    else
	# Error
        erb :'libraries/new'
    end
end


get '/libraries/:id' do
    @library = Library.find params[:id]
   erb :'libraries/edit'
end


put '/libraries/:id' do
    @library = Library.find params[:id]

    @library.update_attributes params[:library]

    if @library.save
	redirect '/'
    else
	# Error
        erb :'libraries/edit'
    end
end


# DNS servers
get '/dns_servers/new' do
    @dns_server = DnsServer.new
    erb :'dns_servers/new'
end

put '/dns_servers' do
    @dns_server = DnsServer.new params[:dns_server]

    if @dns_server.save
	redirect '/'
    else
	# Error
        erb :'dns_servers/new'
    end
end


get '/dns_servers/:id' do
    @dns_server = DnsServer.find params[:id]
   erb :'dns_servers/edit'
end


put '/dns_servers/:id' do
    @dns_server = DnsServer.find params[:id]

    @dns_server.update_attributes params[:dns_server]

    if @dns_server.save
	redirect '/'
    else
	# Error
        erb :'dns_server/edit'
    end
end


# Distribution servers
get '/distribution_servers/new' do
    @distribution_server = DistributionServer.new
    erb :'distribution_servers/new'
end

put '/distribution_servers' do
    @distribution_server = DistributionServer.new params[:distribution_server]

    if @distribution_server.save
	redirect '/'
    else
	# Error
        erb :'distribution_servers/new'
    end
end


get '/distribution_servers/:id' do
    @distribution_server = DistributionServer.find params[:id]
   erb :'distribution_servers/edit'
end


put '/distribution_servers/:id' do
    @distribution_server = DistributionServer.find params[:id]

    @distribution_server.update_attributes params[:distribution_server]

    if @distribution_server.save
	redirect '/'
    else
	# Error
        erb :'distribution_servers/edit'
    end
end

helpers do

    # Usage: partial :foo    
    def partial(page, options={})
	erb page, options.merge!(:layout => false)
    end

    def link_to_library(what)
	return '<a href="/libraries/'+what[:id].to_s+'">'+what.name+'</a>'
    end
    def link_to_dns_server(what)
	return '<a href="/dns_servers/'+what[:id].to_s+'">'+what.name+'</a>'
    end
    def link_to_distribution_server(what)
	return '<a href="/distribution_servers/'+what[:id].to_s+'">'+what.name+'</a>'
    end

end

# filters
before do
  # Params hash
  new_params = {}
  params.each_pair do |full_key, value|
    this_param = new_params
    split_keys = full_key.split(/\]\[|\]|\[/)
    split_keys.each_index do |index|
      break if split_keys.length == index + 1
      this_param[split_keys[index]] ||= {}
      this_param = this_param[split_keys[index]]
   end
   this_param[split_keys.last] = value
  end
  request.params.replace new_params
end
