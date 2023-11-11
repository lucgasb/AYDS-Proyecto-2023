# frozen_string_literal: true

require 'sinatra/base'
require 'bundler/setup'
require 'sinatra/reloader' if Sinatra::Base.environment == :development
require 'sinatra/activerecord'
require 'sinatra/contrib'
require_relative 'models/user'
require_relative 'models/question'
require_relative 'models/option'
require_relative 'models/exam'
require_relative 'models/practice'
require_relative 'models/visited'
require_relative 'controllers/exams_controller'
require_relative 'controllers/practice_controller'
require_relative 'controllers/users_controller'

class App < Sinatra::Application

  use UsersController
  use ExamsController
  use PracticeController

  def initialize(_app = nil)
    super()
  end

  configure do
    enable :sessions
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id].to_i) if session[:user_id]
  end

  set :root,  File.dirname(__FILE__)
  set :views, (proc { File.join(root, 'views') })

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

end
