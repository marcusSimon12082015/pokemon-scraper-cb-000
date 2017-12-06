class Pokemon
  attr_accessor :id,:name,:type, :db
  @@all = []
  def initialize(id:,name:,type:,db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end
  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon(id,name,type) VALUES(?,?,?)",1,name,type)
  end
  def self.find(id,db)
    pokemon_object = db.execute("SELECT * FROM pokemon WHERE id = ?",id)
    new_pokemon.new(pokemon_object.id,pokemon_object.name,pokemon.type,nil)
    new_pokemon
  end
end
