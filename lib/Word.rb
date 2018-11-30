class Word
  attr_reader :id, :name, :definitions
  attr_accessor :image_link
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


  def self.sort_alphabetically
    @@word_list = @@word_list.sort_by {|each| each.name}
  end

  def self.sort_id
    @@word_list = @@word_list.sort_by {|each| each.id}
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
    unless attributes[:definition] == nil
      @definitions.push(attributes[:definition])
    end
    unless attributes[:add_definition] == nil
      @definitions.push(attributes[:add_definition])
    end
  end


  def save
    @@word_list.push(self)
  end



end
