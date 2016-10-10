class AddQuantidadeSemanasToAula < ActiveRecord::Migration[5.0]
  def change
    add_column :aulas, :quantidade_semanas, :integer
  end
end
