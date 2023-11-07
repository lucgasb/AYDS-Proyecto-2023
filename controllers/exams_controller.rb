class ExamsController < Sinatra::Base
  set :views, File.expand_path('../views', __dir__)

  post '/exam' do
    erb :index3
  end

  post '/exam/play' do
    user = User.find_by(id: session[:user_id])
    @username = user.username.to_s
    @contador ||= 0
    @contador2 ||= 0
    @preguntas = Question.all.shuffle
    @examen = Exam.find_or_create_by(id: params[:id])
    @visited = Visited.all
    @visited.each do |v|
      @contador2 += 1 if v.exam_id == @examen.id
    end
    @preguntas.each do |q|
      @preguntas -= [q] unless Visited.find_by(idq: q.id, exam_id: @examen.id) == nil
    end
    if @contador2 == 17
      user = User.find_by(id: session[:user_id])
      if user.total_score < @examen.score
        user.total_score = @examen.score
        user.save
      end
      erb :end
    elsif !Exam.valid(@examen)
      user = User.find_by(id: session[:user_id])
      if user.total_score < @examen.score
        user.total_score = @examen.score
        user.save
      end
      erb :lost
    else
      @opciones = [@preguntas[@contador].option.option, @preguntas[@contador].option.option2, @preguntas[@contador].option.correct]
      @opciones = @opciones.shuffle
      Visited.create(idq: @preguntas[@contador].id, exam_id: @examen.id)
      @examen.save
      erb :quiz, locals: { examen: @examen, contador: @contador }
    end
  end

  post '/exam/play/correct' do
    logger.info(params)
    if params[:id].present?
      @examen = Exam.find_by(id: params[:id])
      if @examen
        @examen.score = @examen.suma_puntos
        @examen.points_streak += 1
        @examen.save
      end
    end

    erb :respuestaCorrecta, locals: { examen: @examen }
  end

  post '/exam/play/incorrect' do
    if params[:id].present?
      @examen = Exam.find_by(id: params[:id])
      if @examen
        @examen.score = @examen.resta_puntos unless @examen.score.zero?
        @examen.life =@examen.resta_vida
        @examen.points_streak = 0
        @examen.save
      end
      erb :respuestaIncorrecta, locals: { examen: @examen }
    end
  end
end