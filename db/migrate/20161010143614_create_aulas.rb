class CreateAulas < ActiveRecord::Migration[5.0]
  def change
    create_table :aulas do |t|
      t.date :semana
      t.json :monday
      t.json :tuesday
      t.json :wednesday
      t.json :thursday
      t.json :friday
      t.json :saturday
      t.json :sunday
      t.boolean :dinamica
      t.references :instrutor, foreign_key: true

      t.timestamps
    end
  end
end
