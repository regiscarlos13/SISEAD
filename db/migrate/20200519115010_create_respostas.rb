class CreateRespostas < ActiveRecord::Migration[6.0]
  def change
    create_table :respostas do |t|
      t.references :avaliacao, null: false, foreign_key: true
      t.references :disciplina, null: false, foreign_key: true
      t.references :prova, null: false, foreign_key: true
      t.string :respondido
      t.boolean :certa
      

      t.timestamps
    end
  end
end
