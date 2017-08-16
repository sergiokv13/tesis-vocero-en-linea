class ReportesController < ApplicationController
	def totales	
	  Reporte.crear_total
	end

	def departamentos
	  @counter = Reporte.crear_departamentos
	 end

	 def sectores
	 	 @counter = Reporte.crear_sectores
	 end
end
