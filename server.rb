require 'sinatra/base'
require 'bundler/setup'
require 'sinatra/reloader' if Sinatra::Base.environment == :development
require "sinatra/activerecord"
require_relative 'models/user'
require_relative 'models/question'
require_relative 'models/option'
require_relative 'models/exam'
require_relative 'models/practice'
require_relative 'models/answer'


class App < Sinatra::Application
  def initialize(app = nil)
    super()
  end

  set :root,  File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, 'views') }
  
  configure :production, :development do
    enable :logging

    logger = Logger.new(STDOUT)
    logger.level = Logger::DEBUG if development?
    set :logger, logger
  end

  configure :development do
    register Sinatra::Reloader
    after_reload do
      puts 'Reloaded...'
      logger.info 'Reloaded!!!'
    end
  end

  get '/' do
    erb :index
  end
  post '/' do	
    User.find_or_create_by(email: params[:email], password: params[:password])     
    "Usuario creado!"
  end  
end

