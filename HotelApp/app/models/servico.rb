class Servico < ApplicationRecord
  belongs_to :TipoServico
  belongs_to :Estadia
  belongs_to :Quarto
  belongs_to :Hotel
end
