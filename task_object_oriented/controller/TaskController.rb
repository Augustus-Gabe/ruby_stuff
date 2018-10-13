require_relative "../models/TaskCrud"
require_relative "../models/TaskSearch"
class TaskController
  attr_accessor :lista_tarefas

  def initialize
    @lista_tarefas = []
    @task_crud = TaskCrud.new
    @task_search = TaskSearch.new
  end
  

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
  
  def handleMenu(opcao)

    system('clear')
    if opcao == 1
      puts
      @lista_tarefas << @task_crud.insere_tarefa()
    elsif opcao == 2 
      puts
      @task_crud.ver_tarefas(@lista_tarefas)
    elsif opcao == 3
      puts
      puts @task_search.busca(@lista_tarefas)
    elsif opcao == 4
      puts
      @task_crud.finaliza_tarefa(@lista_tarefas)
    elsif opcao == 5
      @lista_tarefas = @task_crud.carregar_lista("task.txt") || []
    elsif opcao == 6
      @task_crud.salvar_lista(@lista_tarefas, "task.txt")
    elsif opcao == 7
      return 0
    else
      puts
      puts 'Opcao inválida'
    end
    return 1
  end
  
  
  
end