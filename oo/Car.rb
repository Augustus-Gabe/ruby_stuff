class Car

    # Os atributos da classe só podem ser acessados via getter e setter
    def initialize(manufacturer, model, year)
        @manufacturer = manufacturer
        @model = model 
        @year = year
    end

    #getter
    def model
        return @model
    end

    #getter
    def manufacturer
        return @manufacturer
    end 
    #getter
    def year
        return @year
    end



    #setter
    def model=(value)
        @model = value
    end

    def manufacturer=(value)
        @manufacturer = value
    end

    def year=(value)
        @year = year
    end
end
    
car = Car.new('toyota', 'Corolla', 2018)

puts car.model
car.model = 'Etios'


puts car.model

