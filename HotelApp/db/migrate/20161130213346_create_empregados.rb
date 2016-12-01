class CreateEmpregados < ActiveRecord::Migration[5.0]
  def change
    create_table :empregados do |t|
      t.string :nome

      t.timestamps
    end
  end
end
