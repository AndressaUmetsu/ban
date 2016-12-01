class Reserva < ApplicationRecord
  belongs_to :Cliente
  belongs_to :Quarto
  belongs_to :Hotel
end
