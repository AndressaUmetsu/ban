class CreateQuartos < ActiveRecord::Migration[5.0]
  def change
    create_table :quartos do |t|
      t.belongs_to :hotel, index: true, foreign_key: true, null: false
      t.belongs_to :tipo_quarto, index: true, foreign_key: true, null: false
      t.integer :num, null: false
      t.integer :andar, null: false

      t.timestamps
    end
  end
end
