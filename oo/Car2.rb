class Car

    attr_accessor :manufacturer, :model, :year #substitui os métodos getter e setter
    #attr_reader :manufacturer, :model, :year #substitui os métodos getter
    #attr_writer :manufacturer, :model, :year #substitui os métodos setter

    def initialize(manufacturer, model, year)
        @manufacturer = manufacturer
        @model = model 
        @year = year
    end

end
    
car = Car.new('toyota', 'Corolla', 2018)

puts car.model
car.model = 'Etios'


puts car.model