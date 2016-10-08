class CreateInstrutores < ActiveRecord::Migration[5.0]
  def change
    create_table :instrutores do |t|
      t.string :nome
      t.string :email
      t.string :profissao

      t.timestamps
    end
  end
end
