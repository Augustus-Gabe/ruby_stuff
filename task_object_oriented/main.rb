
require_relative "controller/TaskController"

puts "Bem-vindo ao Task List!" 

ativo = 1
lista_tarefas = []

controller = TaskController.new

while ativo == 1
  ativo = controller.handleMenu(controller.menu())
end
