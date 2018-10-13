require_relative "Task"
require_relative "../common/FileHandler"
require_relative "../common/Utilities"
class TaskCrud < Utilities

  def finaliza_tarefa(lista_tarefas)
    if lista_tarefas.length > 0
      puts 
      print_list(lista_tarefas)
      puts
      puts 'selecione o índice da tarefa que deseja finalizar:'
      indice = gets.to_i 
      lista_tarefas[indice -1].mark_as_done  
      puts "tarefa '#{lista_tarefas[indice -1].description}' Finalizada com sucesso"
      return
    end
    puts "não há itens na lista!"
  end
  
  def carregar_lista(file)
    file = FileHandler.read(file)
    if file
      lista_tarefas = []
      file.each_line do |line|
        line = line.split(",") 
        tarefa = Task.new(line[0], true?(line[1].strip))
        lista_tarefas << tarefa
      end  
      file.close
      return lista_tarefas
    end
    puts 'arquivo não existe ou está vazio!'
  end 

  def salvar_lista(lista_tarefas, file_name)
    if FileHandler.write(lista_tarefas, file_name)
      puts "salvo com sucesso"
      return
    end
    puts "Não há itens para salvar!"
  end
  
  def insere_tarefa()
    print 'Digite sua tarefa: '
    tarefa = Task.new (gets.strip)
    puts
    puts 'Tarefa cadastrada: ' + tarefa.description
    return tarefa
  end
  
  def ver_tarefas(lista_tarefas)
    if lista_tarefas.length > 0
      print_list(lista_tarefas)
    else
      puts 'lista vazia!'
    end
  end

end