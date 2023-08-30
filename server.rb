require 'sinatra/base'
require 'bundler/setup'
require 'sinatra/reloader' if Sinatra::Base.environment == :development
require "sinatra/activerecord"
require 'sinatra/contrib'
require_relative 'models/user'
require_relative 'models/question'
require_relative 'models/option'
require_relative 'models/exam'
require_relative 'models/practice'

class App < Sinatra::Application
  def initialize(app = nil)
    super()
  end
  
  configure do
    enable :sessions
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id].to_i) if session[:user_id]
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
    user = User.find_by(username: params[:username], password: params[:password])
    if user != nil
      session[:user_id] = user.id.to_s
      @user = User.find_by(id: session[:user_id])
      erb :index2
    else 
      redirect '/register'
    end  
  end
  
  get '/register' do
    erb :register
  end
  
  post '/register' do
      if params[:password] == params[:password2]
        user = User.create(username: params[:username],email: params[:email],password: params[:password])
        redirect '/'
      else
        redirect '/register'
      end       
  end

  get '/exam' do
    erb :index3
  end

  get '/practice' do
    erb :practica
  end
  get '/practice/theoric' do
    erb :teorico 
  end  
  get '/practice/play' do
    @preguntas = Question.all.shuffle
    @contador ||= 0
    if @contador < @preguntas.length
      @contador += 1
      @practica = Practice.find_or_create_by(id: params[:id])
    end
    @opciones = [@preguntas[@contador].option.option, @preguntas[@contador].option.option2, @preguntas[@contador].option.correct]
    @opciones = @opciones.shuffle
    erb :practicaQuiz
  end

  get '/practice/play/correct' do
    erb :practicaCorrecta
  end  

  get '/practice/play/incorrect' do 
    erb :practicaIncorrecta
  end

  post '/exam/play' do
    @contador ||= 0
    @preguntas = Question.all.shuffle
    @examen = Exam.find_or_create_by(id: params[:id])
    @visited ||= []
    @visited += [@examen.answered_questions]
    if @visited.include?(@preguntas[@contador].id)
      @preguntas = @preguntas - [@preguntas[@contador]] 
    end
    @visited.push(@preguntas[@contador].id)
    @opciones = [@preguntas[@contador].option.option, @preguntas[@contador].option.option2, @preguntas[@contador].option.correct]
    @opciones = @opciones.shuffle
    @examen.answered_questions = @visited
    @examen.save
    if @examen.life == 0
      user = User.find_by(id: session[:user_id])
      if user.total_score < @examen.score
        user.total_score = @examen.score
        user.save
      end   
      erb :lost
    else
      if Question.all.length == @visited.length
        erb :end
      end
      erb :quiz, locals: { examen: @examen, contador: @contador }
    end
  end
  
  get '/exam/play' do
    @examen = Exam.find_by(id: params[:id])
    if @examen != nil
      erb :quiz, locals: {examen: @examen, contador: @contador}
    end
  end

  get '/exam/play/correct' do
    logger.info(params)
    if params[:id].present?
      @examen = Exam.find_by(id: params[:id])
      if @examen
        @examen.score += 10
        @examen.save
      end
    end

    erb :respuestaCorrecta, locals: { examen: @examen }
  end
  
  get '/exam/play/incorrect' do
    if params[:id].present?
      @examen = Exam.find_by(id: params[:id])
      if @examen
        if @examen.score == 0
          @examen.life -= 1
          @examen.save
        else
          @examen.score -= 5
          @examen.life -= 1
          @examen.save
        end    
      end
    erb :respuestaIncorrecta, locals: { examen: @examen }
    end
  end
end