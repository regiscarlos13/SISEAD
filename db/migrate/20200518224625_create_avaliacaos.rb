class CreateAvaliacaos < ActiveRecord::Migration[6.0]
  def change
    create_table :avaliacaos do |t|
      t.string :name
      t.integer :n
      t.string :nota
      t.references :disciplina, null: false, foreign_key: true

      t.timestamps
    end
  end
end
