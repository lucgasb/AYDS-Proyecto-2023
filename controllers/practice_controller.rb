class PracticeController < Sinatra::Base
  
  set :views, File.expand_path('../views', __dir__)
  
  post '/practice' do
    erb :practica
  end
  post '/practice/theoric' do
    erb :teorico
  end

  post '/practice/play' do
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

  get '/practice/signal' do
    @signals = Question.where(theme: 1).shuffle
    @count ||= 0
    if @count < @signals.length
      @count += 1
      @practica = Practice.find_or_create_by(id: params[:id])
    end
    @options = [@signals[@count].option.option, @signals[@count].option.option2, @signals[@count].option.correct]
    @options = @options.shuffle
    erb :signal
  end

  post '/practice/definition' do
    @definition = Question.where(theme: 2).shuffle
    @count ||= 0
    if @count < @definition.length
      @count += 1
      @practica = Practice.find_or_create_by(id: params[:id])
    end
    @options = [@definition[@count].option.option, @definition[@count].option.option2, @definition[@count].option.correct]
    @options = @options.shuffle
    erb :definition
  end

  post '/practice/safety-road' do
    @safety = Question.where(theme: 3).shuffle
    @count ||= 0
    if @count < @safety.length
      @count += 1
      @practica = Practice.find_or_create_by(id: params[:id])
    end
    @options = [@safety[@count].option.option, @safety[@count].option.option2, @safety[@count].option.correct]
    @options = @options.shuffle
    erb :safety
  end

  post '/practice/correct' do
    erb :practicaCorrecta
  end

  post '/practice/incorrect' do
    erb :practicaIncorrecta
  end
end