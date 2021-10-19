class CreateAulas < ActiveRecord::Migration[6.0]
  def change
    create_table :aulas do |t|
      t.integer :aula
      t.string :conteudo
      t.string :video
      t.references :disciplina, null: false, foreign_key: true

      t.timestamps
    end
  end
end
