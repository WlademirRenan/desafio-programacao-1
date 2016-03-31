class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.string :comprador
      t.string :descricao
      t.float :preco_unitario
      t.integer :quantidade
      t.string :endereco
      t.string :fornecedor
      t.float :valor_total

      t.timestamps
    end
  end
end
