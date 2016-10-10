class CreateInstanciaAulas < ActiveRecord::Migration[5.0]
  def change
    create_table :instancia_aulas do |t|
      t.datetime :inicio
      t.datetime :fim
      t.references :aula, foreign_key: true

      t.timestamps
    end
  end
end
