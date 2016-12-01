class CreateTipoQuartos < ActiveRecord::Migration[5.0]
  def change
    create_table :tipo_quartos do |t|
      t.string :nome
      t.decimal :preco

      t.timestamps
    end
  end
end
