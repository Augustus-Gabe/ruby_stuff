require 'pry'
puts "Bem-vindo ao Task List!" 

ativo = 1
lista_tarefas = []


def menu()
  puts
  puts "Escolha uma opção no menu: \n"
  puts '[1] Inserir uma tarefa'
  puts '[2] Ver todas as tarefas'
  puts '[3] Buscar tarefas'
  puts '[4] Finalizar tarefa'
  puts '[5] Encerrar programa.'
  puts
  print 'Opção escolhida: '

  gets.to_i
end

def busca(lista_tarefas)
  elementos_encontrados = []
  if lista_tarefas.length > 0
    puts 'digite o termo que deseja pesquisar:'
    termo = gets.strip
    lista_tarefas.each do |item|
      if item["tarefa"].downcase.include? termo.downcase
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

def finaliza_tarefa(lista_tarefas)
  puts 
  lista_tarefas.each_with_index {|item, index|
    puts "##{index + 1} - #{item}"
  }
  puts
  puts 'selecione o índice da tarefa que deseja finalizar:'
  indice = gets.to_i
  # não é preciso fazer referência, ruby trata tudo como classes, então uma modificação 
  # no elemento, não importa o escopo, altera a classe em si.
  lista_tarefas[indice -1]["finalizada"] = true
  puts "tarefa '#{lista_tarefas[indice -1]["tarefa"]}' concluída com sucesso"
end

while ativo == 1
 
  opcao = menu()

  system('clear')
    
  if opcao == 1
    print 'Digite sua tarefa: '
    tarefa = Hash.new 
    tarefa["tarefa"] = gets.strip
    tarefa["finalizada"] = false
    puts
    lista_tarefas << tarefa
    puts 'Tarefa cadastrada: ' + tarefa["tarefa"]
  elsif opcao == 2 
    puts 
    lista_tarefas.each_with_index {|item, index|
      puts "##{index + 1} - #{item}"
    }
  elsif opcao == 3
    puts
    puts busca(lista_tarefas)
  elsif opcao == 4
    puts
    finaliza_tarefa(lista_tarefas)
  elsif opcao == 5
    ativo = 0
  else
    puts
    puts 'Opcao inválida'
  end
end
