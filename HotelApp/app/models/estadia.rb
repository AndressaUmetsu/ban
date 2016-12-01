class Estadia < ApplicationRecord
  belongs_to :cliente
  belongs_to :quarto
  belongs_to :hotel
end
