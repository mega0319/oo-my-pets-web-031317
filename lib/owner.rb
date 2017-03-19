require 'pry'

class Owner
  # code goes here
  @@all = []
  @@count = 0

  attr_reader :species
  attr_accessor :name, :pets

  def initialize(species)
    @species = species
    @@all << self
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @@count += 1
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all = []
    @@count = 0
  end

  def say_species
    "I am a #{@species}."
  end

  def self.count
    @@count
  end

  def buy_fish(name)
    self.pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    self.pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    self.pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    self.pets[:dogs].each do |dog_instance|
      dog_instance.mood = "happy"
    end
  end

  def play_with_cats
    self.pets[:cats].each do |cat_instance|
      cat_instance.mood = "happy"
    end
  end

  def feed_fish
    self.pets[:fishes].each do |fish_instance|
      fish_instance.mood = "happy"
    end
  end

  def sell_pets
    self.pets.map do |type, data|
      data.map do |instance|
        instance.mood = "nervous"
      end
      data.clear
    end
  end

  def list_pets
    fish_number = self.pets[:fishes].count
    dog_number = self.pets[:dogs].count
    cat_number = self.pets[:cats].count
    "I have #{fish_number} fish, #{dog_number} dog(s), and #{cat_number} cat(s)."
  end





end
