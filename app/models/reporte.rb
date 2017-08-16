class Reporte < ApplicationRecord
	def self.crear_total
	  url_terminal = "http://104.131.40.8/reporte_total"
      url = URI.parse(url_terminal)
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
      }
      @datasets = Hash.new
      @address_result = JSON.parse res.body
	  
	  Opcion.all.each do |opcion|
	  	dir = opcion.direccion.strip
	  	if @address_result[dir] != nil
		  	@datasets[opcion.nombre] = @address_result[dir]
		  end
	  end

    
	      g = Gruff::Pie.new
	    g.title = "Votación global por partidos"
	    @datasets.each do |data|
	      g.data(data[0], data[1])
	    end
     g.write("/Users/sergiokv13/Programacion/Rails/Tesis/vocero_en_linea/app/assets/images/pietotal.png")
	end

	def self.crear_departamentos
	  url_terminal = "http://104.131.40.8/reporte_parcial_departamentos"
      url = URI.parse(url_terminal)
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
      }
      @datasets = Hash.new
      counter = 0
      @departamentos_result = JSON.parse res.body
      @departamentos_result.keys.each do |departamento_id|
      	@address_result = @departamentos_result[departamento_id]

		  Opcion.all.each do |opcion|
		  	dir = opcion.direccion.strip
		  	if @address_result[dir] != nil
			  	@datasets[opcion.nombre] = @address_result[dir]
			end
		  end
		   g = Gruff::Pie.new
		    g.title = "Votación por departamento " + departamento_id
		    @datasets.each do |data|
		      g.data(data[0], data[1])
		    end
		    counter+=1
	       g.write("/Users/sergiokv13/Programacion/Rails/Tesis/vocero_en_linea/app/assets/images/pie_departamento_" + counter.to_s + ".png")      

      end
      return counter
	end

	def self.crear_sectores
	 url_terminal = "http://104.131.40.8/reporte_parcial_sectores"
     url = URI.parse(url_terminal)
     req = Net::HTTP::Get.new(url.to_s)
     res = Net::HTTP.start(url.host, url.port) {|http|
       http.request(req)
     }
     @datasets = Hash.new
     counter = 0
     @sectores_result = JSON.parse res.body
     @sectores_result.keys.each do |sector_id|
      	@address_result = @sectores_result[sector_id]

			  Opcion.all.each do |opcion|
			  	dir = opcion.direccion.strip
			  	if @address_result[dir] != nil
				  	@datasets[opcion.nombre] = @address_result[dir]
				end
			  end
			   g = Gruff::Pie.new
			    g.title = "Votacion por sector " + sector_id
			    @datasets.each do |data|
			      g.data(data[0], data[1])
			    end
			    counter+=1
		       g.write("/Users/sergiokv13/Programacion/Rails/Tesis/vocero_en_linea/app/assets/images/pie_sector_" + counter.to_s + ".png")      

      	end
      	return counter
  	end

end
