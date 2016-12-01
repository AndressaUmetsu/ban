json.extract! tipo_servico, :id, :nome, :custo, :created_at, :updated_at
json.url tipo_servico_url(tipo_servico, format: :json)