class Word
  attr_reader :id, :name, :definitions
  @@word_list = []

  def initialize(attributes)
    @name = attributes[:name]
    @definitions = []
    add_definition(attributes)
    @id = @@word_list.length + 1
  end


  def self.all
    @@word_list
  end

  def self.clear
    @@word_list = []
  end


  def self.find(id)
    for each in @@word_list
      if each.id == id.to_i
        return each
      end
    end
    "Word ID not found in word list."
  end


  def add_definition(attributes)
    @definitions.push(attributes[:definition])
  end


  def save
    @@word_list.push(self)
  end



end
