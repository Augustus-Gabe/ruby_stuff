puts "Bem-vindo ao Task List!" 

ativo = 1
lista_tarefas = []
tarefa = ""

while ativo == 1
 
  puts
  puts "Escolha uma opção no menu: \n"
  puts '[1] Inserir uma tarefa'
  puts '[2] Ver todas as tarefas'
  puts '[3] Encerrar programa.'
  puts
  print 'Opção escolhida: '

  opcao = gets.to_i

  if opcao == 1
    print 'Digite sua tarefa: '
    tarefa = gets
    puts
    lista_tarefas << tarefa
    puts 'Tarefa cadastrada: ' + tarefa
  elsif opcao == 2 
    puts 
    puts lista_tarefas
  elsif opcao == 3
    ativo = 0
  else
    puts
    system('clear')
    puts 'Opcao inválida'
  end
end
