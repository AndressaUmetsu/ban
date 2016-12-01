class CreateQuartos < ActiveRecord::Migration[5.0]
  def change
    create_table :quartos do |t|
      t.belongs_to :hotel, index: true, unique: true, foreign_key: true
      t.integer :num
      t.integer :andar

      t.timestamps
    end
  end
end
