require 'rubygems'
require 'sinatra'
require 'init'

get '/' do
    @distribution_servers = DistributionServer.all :order => :name
    erb :dashboard
end

