Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	# Look at the PostsController and then the index method
	root 'posts#index'

	# Example of a regular route
	get 'about' => 'pages#about'

	# Maps HTTP verbs too controller actions
	resources :posts
end
