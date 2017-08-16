class WelcomeController < ApplicationController
	def index
	Votacion.set_votacion
	Partido.set_partidos
  	@votacion = Votacion.first
  	@partidos = Partido.all
  end

  def visualizar_papeleta
  	@votacion = Votacion.first
    @partidos = Partido.all
    render :layout => false
  end
end
