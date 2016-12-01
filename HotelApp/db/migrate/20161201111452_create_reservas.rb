class CreateReservas < ActiveRecord::Migration[5.0]
  def change
    create_table :reservas do |t|
      t.date :dataReserva, null: false
      t.date :dataCheckIn, null: false
      t.date :dataCheckOut, null: false
      t.decimal :ValorEntrada, null: false
      t.references :quarto, foreign_key: true, null: false
      t.references :hotel, foreign_key: true, null: false
      t.references :cliente, foreign_key: true, null: false

      t.timestamps
    end
  end
end
