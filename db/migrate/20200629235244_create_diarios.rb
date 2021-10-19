class CreateDiarios < ActiveRecord::Migration[6.0]
  def change
    create_table :diarios do |t|
      t.references :disciplina, null: false, foreign_key: true
      t.integer :n

      t.timestamps
    end
  end
end
