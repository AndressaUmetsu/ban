class CreateEmpregados < ActiveRecord::Migration[5.0]
  def change
    create_table :empregados do |t|
      t.string :nome, null: false

      t.timestamps
    end
  end
end
