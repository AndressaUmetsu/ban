class CreateLimpezas < ActiveRecord::Migration[5.0]
  def change
    create_table :limpezas do |t|
      t.date :data, null: false
      t.time :hora, null: false

      t.timestamps
    end
  end
end
