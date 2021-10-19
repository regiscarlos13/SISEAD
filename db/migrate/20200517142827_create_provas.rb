class CreateProvas < ActiveRecord::Migration[6.0]
  def change
    create_table :provas do |t|
      t.references :disciplina, null: false, foreign_key: true

      t.timestamps
    end
  end
end
