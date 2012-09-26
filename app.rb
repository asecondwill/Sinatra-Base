require 'rubygems'
require 'sinatra'
require 'data_mapper'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'

SITE_TITLE = "Campaign Landing Page"
SITE_DESCRIPTION = "Buy stuff. From us. "

enable :sessions

####################################################
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/campaign.db")
class Person
    include DataMapper::Resource
    property :id, Serial
    property :first_name, String , required: true 
    property :last_name, String , required: true 
    property :email, String , required: true, :format => :email_address 
    property :created_at, DateTime
end

DataMapper.finalize.auto_upgrade!  

####################################################

get '/' do
   @title = 'Welcome'
   erb :home  
end

get '/success' do
   @title = 'Success!!!'
   erb :success  
end


post '/' do
  p = Person.new
  p.attributes = {
    :first_name => params[:first_name],
    :last_name => params[:last_name],
    :email => params[:email],
    :created_at => Time.now    
  }
  if p.save
    redirect '/success', :notice => 'Yay.  Thanks for registering.'   
   else
     @error   =   'There was a problem.  Please review'
     @values  =   params
     @person  =   p
   end
   erb :home  
end

######################################################


helpers do
  def field_validation(target, field)
    "<span class=\"field-validation-error\">#{target.errors[field][0]}</span>" unless target.errors[field].empty?
  end
end