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

helpers do

    # Usage: partial :foo    
    def partial(page, options={})
	erb page, options.merge!(:layout => false)
    end

    def link_to(what) # TODO: pretty much everything
	return '<a href="/libraries/'+what[:id].to_s+'">'+what.name+'</a>'
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
