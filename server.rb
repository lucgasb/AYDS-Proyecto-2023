require 'sinatra/base'
require 'bundler/setup'
require 'sinatra/reloader' if Sinatra::Base.environment == :development
require "sinatra/activerecord"
require_relative 'models/user'
require_relative 'models/question'
require_relative 'models/option'
require_relative 'models/exam'
require_relative 'models/practice'


class App < Sinatra::Application
  def initialize(app = nil)
    super()
  end

  set :root,  File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, 'views') }
  set :public_folder, File.join(root, 'static')
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
  post '/game' do	
    User.find_or_create_by(email: params[:email], password: params[:password])     
    erb :index2
  end
  
  post '/game/exam' do
    erb :index3
  end

  post '/game/practice' do
    "Modo Practica"
  end 

  post '/game/exam/play' do
    @pregunta = Question.first
    @respuesta = params[:respuesta]  
    erb :quiz
  end
end

