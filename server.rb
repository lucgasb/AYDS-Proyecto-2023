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
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
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
    erb :practica
  end
  
  post '/game/practice/play' do
    @preguntas = Question.all.shuffle
    @contador ||= 0
    if @contador < @preguntas.length
      @contador += 1
    end
    erb :practicaQuiz  
  end

  post '/game/practice/play/correct' do
    erb :practicaCorrecta
  end  

  post '/game/practice/play/incorrect' do 
    erb :practicaIncorrecta
  end

  post '/game/exam/play' do
    @preguntas = Question.all.shuffle
    @contador ||= 0 
    if @contador < @preguntas.length
      @contador += 1
      @examen = Exam.find_or_create_by(score: 0, lifes: 3, user_id: current_user.id)  
    end if current_user
    erb :quiz, locals: { examen: @examen }
  end
  
  post '/game/exam/play/correct' do
    if params[:examen_id].present?
      @examen = Exam.find(params[:examen_id])
      @examen.score += 3
      @examen.save
    end if current_user  
      erb :respuestaCorrecta, locals: { examen: @examen }
  end

  post '/game/exam/play/incorrect' do
    if params[:examen_id].present?
    @examen = Exam.find(params[:examen_id])
    @examen.score -= 2
    @examen.save
    end if current_user
    erb :respuestaIncorrecta, locals: { examen: @examen }
  end  
end
