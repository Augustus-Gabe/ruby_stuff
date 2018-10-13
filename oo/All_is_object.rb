
# Modificamos a própria classe integer para atribuir novos comportamenteos aos números
class Integer
    def apresentar()
        puts "Olá, eu sou o número #{self}"
    end

    def + (value)
        self - value
    end
end



4.apresentar()

puts 1 + 1