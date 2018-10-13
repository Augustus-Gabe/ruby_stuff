require_relative "../common/Utilities"
class TaskSearch < Utilities

  def busca(lista_tarefas)
  elementos_encontrados = []
  if lista_tarefas.length > 0
    puts 'digite o termo que deseja pesquisar:'
    termo = gets.strip
    lista_tarefas.each do |item|
      if check_if_includes(item.description, termo)
        elementos_encontrados << item
      end
    end
      if elementos_encontrados.length > 0
        puts 
        puts "foram encontrados os elementos a seguir \n "
        return elementos_encontrados
      end
      return 'não foi encontrado nenhum elemento com o termo usado.'
  end
  return 'não há itens na lista!'
end
  
end