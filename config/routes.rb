Rails.application.routes.draw do
	

	root 'messages#showreceivedmessage'
	# root 'session#new'
	# get '/', to: 'session#new'

	resources :friendships, only: [:create, :destroy]
	resources :blocklists, only: [:create, :destroy]

	get '/messages/showreceivedmessage', to: 'messages#showreceivedmessage', as: :show_message
	get '/messages/show/:id', to: 'messages#show', as: :message

	get '/messages/new', to: 'messages#new', as: :new_message
	post '/messages', to: 'messages#create', as: :create_message
	get '/messages/showsentmessage', to: 'messages#showsentmessage', as: :showsentmessage

	get '/sessions/login', to: 'sessions#new', as: :login
	post '/sessions/login', to: 'sessions#create', as: nil

	delete '/sessions/logout', to: 'sessions#destroy', as: :logout

	get '/users/new', to: 'users#new', as: :new_user
	
	get '/users', to: 'users#show', as: :users
	# get '/users/:id', to: 'users#show', as: :users

	post '/users', to: 'users#create', as: :create_user

	# get '/users', to: 'users#index', as: nil
	

	# post '/users/:id/:friend_id', to: 'friendships#create', as: :friendships
	
	get '/inboxs', to: 'inboxs#index', as: :inboxs
	# get '/inboxs/:id', to: 'messages#show', as: :message
end
