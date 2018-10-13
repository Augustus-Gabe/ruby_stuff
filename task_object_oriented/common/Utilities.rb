class Utilities
  
  def self.true?(obj)
    obj.to_s == "true"
  end

  def self.print_list(array)
    array.each_with_index {|item, index|
      puts "##{index + 1} - #{item}"
    }
  end

  def self.check_if_includes(item, term)
    item.downcase.include? term.downcase
  end
  
end