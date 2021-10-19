class CreateDisciplinas < ActiveRecord::Migration[6.0]
  def change
    create_table :disciplinas do |t|
      t.string :name
      t.integer :professor
      t.integer :serie
      t.integer :turma

      t.timestamps
    end
  end
end
