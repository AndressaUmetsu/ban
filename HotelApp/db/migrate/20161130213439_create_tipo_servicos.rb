class CreateTipoServicos < ActiveRecord::Migration[5.0]
  def change
    create_table :tipo_servicos do |t|
      t.string :nome
      t.decimal :custo

      t.timestamps
    end
  end
end
