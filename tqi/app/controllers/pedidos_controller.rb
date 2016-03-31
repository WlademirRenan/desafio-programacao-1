class PedidosController < ApplicationController

  def index
    @pedido = Pedido.new
  end
  
  def index_do
    unless params[:pedido].nil?
      # Metodo de classe para gravar conteudo do formulário
      @numero_pedidos_importados = Pedido.inserir_pedidos(params[:pedido])
      @pedidos = Pedido.order("created_at DESC").limit(@numero_pedidos_importados).reverse
      @valor_total_pedidos = @pedidos.inject(0){|total, pedido| total = total + pedido.valor_total}
    else
      @pedido = Pedido.new
      flash[:notice] = "Insira algum arquivo de pedidos"
      render :action => 'index'
    end
  end
end
