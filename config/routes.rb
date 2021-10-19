Rails.application.routes.draw do

  get 'calendars/new'
  get 'calendars/create'
  get 'admin/index'


  resources :forums do

    resources :responders
  end

    resources :calendars, only: [:create]
  resources :disciplinas do
    resources :aulas
    resources :provas
    resources :avaliacaos 
    get '/aluno_prova/:id', to: 'avaliacaos#aluno_prova', as: 'aluno_prova'

  end

  resources :avaliacaos


  resources :aulas, only:  [:show ]
  resources :respostas

  get 'ead/index'
  get 'educacao/calendario'
  get 'educacao/infantil'
  get 'educacao/fundamental1'
  get 'educacao/fundamental2'
  get 'educandario/escola'
  get 'educandario/direcao'
  get 'educandario/professores'
  get 'educandario/equipe'
  get 'home/contatos'


  root 'home#index'

  get 'mudar_disciplina', controller: 'application', action: 'set_mudar_disciplina'
  
  get 'senha', controller: 'application', action: 'set_senha'

  get 'professor_senha', controller: 'application', action: 'set_professor_senha'
  
  get 'planejamento', controller: 'disciplinas', action: 'planejamento'
  
#  get 'resolver', controller: 'ead', action: 'prova'


get '/provas/:id', to: 'provas#new', as: 'provas'

get '/aluno/:id', to: 'avaliacaos#aluno', as: 'aluno'

get '/correcao/:id', to: 'avaliacaos#correcao', as: 'correcao'

get '/diarios/:id', to: 'diarios#diario', as: 'diarios'

match 'provas/:id', to: 'provas#create', via: [:post]



#match 'provas_delete', to: 'admin#provas_delete', via: [:delete]


  
delete '/provas/:id', controller: 'admin', action: 'provas_delete'

resources :admin, only: [:destroy]

get '/calendario/:id', to: 'admin#calendario', as: 'calendario'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
