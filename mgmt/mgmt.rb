require 'rubygems'
require 'sinatra'
require 'init'

get '/' do
    @distribution_servers = DistributionServer.all :order => :name
    @dns_servers = DnsServer.all :order => :name
    @libraries = Library.all :order => :name
    erb :dashboard
end

