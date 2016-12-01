class CreateLimpezas < ActiveRecord::Migration[5.0]
  def change
    create_table :limpezas do |t|
      t.date :data
      t.time :hora

      t.timestamps
    end
  end
end
