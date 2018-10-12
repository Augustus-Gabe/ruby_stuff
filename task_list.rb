require 'json'
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
  puts '[5] Carregar lista de tarefas'
  puts '[6] Salvar lista de tarefas'
  puts '[7] Encerrar programa.'
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

def carregar_lista
  if File.exist?("task.txt") && !File.zero?("task.txt")
    lista_tarefas = []
    file_data = File.readlines('task.txt').each do |item|
      array = item.split(',')
      tarefa = Hash.new 
      tarefa["tarefa"] = array[0]
      tarefa["finalizada"] = true?(array[1])
      lista_tarefas << tarefa
    end
    return lista_tarefas
  end
  puts 'arquivo não existe ou está vazio!'
end

def true?(obj)
  obj.to_s == "true"
end

def salvar_lista(lista_tarefas)
  File.open('task.txt', 'w') do |file|
    lista_tarefas.each {|item|
      string = "#{item['tarefa']},#{item['finalizada']} \n"
      file.write(string)
    }
  end
end

def insere_tarefa()
  print 'Digite sua tarefa: '
  tarefa = Hash.new 
  tarefa["tarefa"] = gets.strip
  tarefa["finalizada"] = false
  puts
  puts 'Tarefa cadastrada: ' + tarefa["tarefa"]
  return tarefa
end

def ver_tarefas(lista_tarefas)
  if lista_tarefas.length > 0
    lista_tarefas.each_with_index {|item, index|
      puts "##{index + 1} - #{item['tarefa']}: #{item['finalizada'] ? "Concluida" : "Pendente"}"
    }
  else
    puts 'lista vazia!'
  end
end

while ativo == 1
 
  opcao = menu()

  system('clear')
    
  if opcao == 1
    puts
    lista_tarefas << insere_tarefa()
  elsif opcao == 2 
    puts
    ver_tarefas(lista_tarefas)
  elsif opcao == 3
    puts
    puts busca(lista_tarefas)
  elsif opcao == 4
    puts
    finaliza_tarefa(lista_tarefas)
  elsif opcao == 5
    lista_tarefas = carregar_lista() || []
  elsif opcao == 6
    salvar_lista(lista_tarefas)
  elsif opcao == 7
    ativo = 0
  else
    puts
    puts 'Opcao inválida'
  end
end
