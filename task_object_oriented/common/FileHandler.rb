class FileHandler

  attr_accessor :file

  def initialize
    @file = nil
  end

  def self.read(file_name)
    if File.exist?(file_name) && !File.zero?(file_name)
      @file = File.open(file_name , 'r') 
      return @file
    end
    return false
  end
          
  #escreve os itens de um array multidimensional em um aquivo
  def self.write(array, file_name)
    if array.length > 0
      @file = File.open(file_name, 'w') do |file|
        array.each {|items|   
          #TODO: encontrar uma forma de iterar sobre os atributos
          #da classe para tornar função mais genérica
          string = "#{items.description},#{items.status}\n"    
          file.write(string)
        }
      end  
      return true
    end
    return false
  end

  def close
    @file.close
  end
end