class CreateHotels < ActiveRecord::Migration[5.0]
  def change
    create_table :hotels do |t|
      t.string :nome, null: false
      t.string :endereco, null: false
      t.string :telefone, null: false

      t.timestamps
    end
  end
end
