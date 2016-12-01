class CreateServicos < ActiveRecord::Migration[5.0]
  def change
    create_table :servicos do |t|
      t.date :dataCheckIn # podemos deletar essa linha
      t.date :data, null: false
      t.time :hora, null: false
      t.references :tipo_servico, foreign_key: true, null: false
      t.references :estadia, foreign_key: true, null: false
      t.references :quarto, foreign_key: true, null: false
      t.references :hotel, foreign_key: true, null: false

      t.timestamps
    end
  end
end
