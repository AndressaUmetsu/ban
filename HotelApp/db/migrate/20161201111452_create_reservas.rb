class CreateReservas < ActiveRecord::Migration[5.0]
  def change
    create_table :reservas do |t|
      t.date :data_reserva, null: false
      t.date :data_checkin, null: false
      t.date :data_checkout, null: false
      t.decimal :valor_entrada, null: false
      t.references :quarto, foreign_key: true, null: false
      t.references :hotel, foreign_key: true, null: false
      t.references :cliente, foreign_key: true, null: false

      t.timestamps
    end
  end
end
