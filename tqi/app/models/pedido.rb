class Pedido < ActiveRecord::Base

  def self.inserir_pedidos(params)
    #lendo arquivo
    file = params[:arquivo].read
    # Separando por linhas e forcando a codificao utf-8
    pedidos_por_linha = file.force_encoding('utf-8').split("\n")
    pedidos_por_linha.each_with_index do |linha, index|
      # pulando primeira linha que é o cabeçalho
      next if index.eql? 0
      # separando por tabulação
      pedido = linha.split("\t")
      # criando pedido
      criar_pedido(pedido)
    end
    pedidos_por_linha.size - 1
  end

  def self.criar_pedido(pedido)
    novo_pedido = Pedido.new(comprador: pedido[0], descricao: pedido[1],
      preco_unitario: pedido[2], quantidade: pedido[3], endereco: pedido[4],
      fornecedor: pedido[5], valor_total: (pedido[2].to_f * pedido[3].to_i))
    # gravando novo pedido
    novo_pedido.save
  end
end
