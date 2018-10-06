def procedimento
    puts "procedimento dahora"
    #não há retorno explícito, mas a função sempre retornará a última operação
end

def funcao(mensagem)
    return "mensagem recebida: #{mensagem}"
end

def soma_valores(valor1, valor2) 
    valor1 + valor2
end

procedimento()

puts 'digite alguma coisa para a mensagem'
mensagem = gets.strip

puts funcao(mensagem)


puts soma_valores(10,25)