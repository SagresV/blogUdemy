class WelcomeController < ApplicationController
	def index
		@articulos = Article.all
	end
	def contacto
		@email = "bansheeII@hotmail.com"
	end
end