class AddRelations < ActiveRecord::Migration[5.0]
  def change
    add_reference :quartos, :tipo_quarto, index: true, foreign_key: true
  end
end
