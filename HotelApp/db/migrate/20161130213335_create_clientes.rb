class CreateClientes < ActiveRecord::Migration[5.0]
  def change
    create_table :clientes do |t|
      t.string :nome, null: false
      t.string :endereco
      t.string :telefone, null: false

      t.timestamps
    end
  end
end
