Rails.application.routes.draw do
  # Ruta para mostrar la vista de carga de archivo PDF
  get '/upload', to: 'documents#new'

  # Rutas para cargar el archivo PDF y para firmarlo
  resources :documents do
    member do
      get 'sign'
      post 'sign'
      get 'download_signed'
    end
  end

  # Ruta para descargar el archivo PDF firmado
  get '/download', to: 'documents#download'
end
