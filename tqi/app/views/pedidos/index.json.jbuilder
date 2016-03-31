json.array!(@pedidos) do |pedido|
  json.extract! pedido, :id, :comprador, :descricao, :preco_unitario, :quantidade, :endereco, :fornecedor, :valor_total
  json.url pedido_url(pedido, format: :json)
end
