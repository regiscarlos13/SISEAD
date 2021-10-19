class CreateResponders < ActiveRecord::Migration[6.0]
  def change
    create_table :responders do |t|
      t.references :forum, null: false, foreign_key: true

      t.timestamps
    end
  end
end
