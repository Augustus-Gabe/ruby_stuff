class Task
    attr_accessor :description, :status
  
    # Podemos passar um valor inicial para status. Dessa forma,
    # ele é opcional no momento da criação. Só há necessidade
    # de usá-lo se queremos criar uma tarefa com status true
    def initialize(description, status = false)
      @description = description
      @status = status
    end
  
    def to_s
      "#{description} | #{status_text}"
    end
  
    def status_text
      if status
        'Feita'
      else
        'Não feita'
      end
    end


    


  end