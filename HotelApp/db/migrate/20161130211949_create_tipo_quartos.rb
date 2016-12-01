class CreateTipoQuartos < ActiveRecord::Migration[5.0]
  def change
    create_table :tipo_quartos do |t|
      t.string :nome, null: false
      t.decimal :preco, null: false

      t.timestamps
    end
  end
end
