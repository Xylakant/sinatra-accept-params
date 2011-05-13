begin
  # Require the preresolved locked set of gems.
  require File.expand_path('../../.bundle/environment', __FILE__)
rescue LoadError
  # Fallback on doing the resolve at runtime.
  require 'rubygems'
  require 'bundler'
  Bundler.setup
end

require 'sinatra'
require 'simplecov'
SimpleCov.start

Bundler.require(:default, :test)


class TestApplication < Sinatra::Base
  register Sinatra::AcceptParams

  set :raise_errors, false
  set :show_exceptions, false

  get '/search' do
    accept_params do |p|
      p.integer :page, :default => 1, :minvalue => 1
      p.integer :limit, :default => 20, :maxvalue => 100
      p.boolean :wildcard, :default => false
      p.string :search, :required => true
      p.float :timeout, :default => 3.5
    end
    params_dump
  end
  
  get '/users' do
    accept_no_params
  end
  
  get '/posts/:id' do
    accept_only_id
  end
end

class Riot::Situation
  include Rack::Test::Methods

  def app
    TestApplication
  end
end

class Riot::Context
  # Set the Rack app which is to be tested.
  #
  #   context "MyApp" do
  #     app { [200, {}, "Hello!"] }
  #     setup { get '/' }
  #     asserts(:status).equals(200)
  #   end
  def app(app=nil, &block)
    setup { @app = (app || block) }
  end
end
