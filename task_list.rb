require 'pry'
puts "Bem-vindo ao Task List!" 

ativo = 1
lista_tarefas = []
tarefa = ""

def menu()
  puts
  puts "Escolha uma opção no menu: \n"
  puts '[1] Inserir uma tarefa'
  puts '[2] Ver todas as tarefas'
  puts '[3] Buscar tarefas'
  puts '[4] Encerrar programa.'
  puts
  print 'Opção escolhida: '

  gets.to_i
end

def busca(lista_tarefas)
  elementos_encontrados = []
  if lista_tarefas.length > 0
    termo = gets.strip
    lista_tarefas.each do |item|
      print item.downcase.include? termo.downcase
      if item.downcase.include? termo.downcase
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

while ativo == 1
 
  opcao = menu()

  system('clear')
    
  if opcao == 1
    print 'Digite sua tarefa: '
    tarefa = gets
    puts
    lista_tarefas << tarefa
    puts 'Tarefa cadastrada: ' + tarefa
  elsif opcao == 2 
    puts 
    lista_tarefas.each_with_index {|item, index|
      puts "##{index + 1} - #{item}"
    }
  elsif opcao == 3
    puts
    puts busca(lista_tarefas)
  elsif opcao == 4
    ativo = 0
  else
    puts
    puts 'Opcao inválida'
  end
end
