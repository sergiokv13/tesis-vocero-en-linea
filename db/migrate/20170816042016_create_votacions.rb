class CreateVotacions < ActiveRecord::Migration[5.1]
  def change
    create_table :votacions do |t|
      t.text :razon
      t.datetime :inicio
      t.datetime :finalizacion
      t.integer :tiempo_maximo_de_votos
      t.string :etapa
      t.integer :balotas

      t.timestamps
    end
  end
end
