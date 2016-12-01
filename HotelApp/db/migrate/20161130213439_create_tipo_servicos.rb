class CreateTipoServicos < ActiveRecord::Migration[5.0]
  def change
    create_table :tipo_servicos do |t|
      t.string :nome, null: false
      t.decimal :custo, null: false

      t.timestamps
    end
  end
end
