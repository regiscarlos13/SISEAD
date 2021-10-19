class AddDataToAula < ActiveRecord::Migration[6.0]
  def change
    add_column :aulas, :data, :date
  end
end
