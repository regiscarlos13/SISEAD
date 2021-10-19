class CreateOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :options do |t|
      t.references :prova, null: false, foreign_key: true
      t.string :name
      t.integer :tipo
      t.boolean :correta

      t.timestamps
    end
  end
end
