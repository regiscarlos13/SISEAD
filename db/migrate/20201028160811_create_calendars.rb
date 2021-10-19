class CreateCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :calendars do |t|
      t.references :disciplina, null: false, foreign_key: true
      t.date :data

      t.timestamps
    end
  end
end
