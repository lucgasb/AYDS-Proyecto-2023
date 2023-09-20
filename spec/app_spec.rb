require 'rack/test'
require_relative '../server.rb'
RSpec.describe 'Sinatra App' do
  include Rack::Test::Methods

  def app
    # incluir el nombre de la clase correspondiente a la Application definida en el server.rb
    
    App
  end

  it 'probando del sign up' do
    get '/' # Accede a la ruta '/signup' 
    expect(last_response.status).to eq(200) # Verifica el código de respuesta HTTP
  end
  
  it 'probando /register' do
    get '/register'
    expect(last_response.status).to eq(200)
  end

  it 'redirige correctamente a /exam' do
    post '/exam'
    expect(last_response).to be_ok # Verifica que la respuesta tenga un estado OK (200)
    expect(last_request.env['REQUEST_METHOD']).to eq('POST') # Verifica que se haya utilizado una solicitud POST
    expect(last_request.path_info).to eq('/exam') # Verifica que la solicitud se haya dirigido a la ruta /exam
    expect(last_response.body).to include('MODO EXAMEN') # Verifica que la respuesta incluye contenido de index3.erb
  end
end