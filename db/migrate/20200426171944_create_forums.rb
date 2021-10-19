class CreateForums < ActiveRecord::Migration[6.0]
  def change
    create_table :forums do |t|
      t.string :aluno
      t.string :topico
      t.references :disciplina, null: false, foreign_key: true
      t.references :aula, null: false, foreign_key: true
      

      t.timestamps
    end
  end
end
