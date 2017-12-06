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
    stm = db.prepare "SELECT * FROM pokemon WHERE id=?"
    stm.bind_param 1, id
    rs = stm.execute
    row = rs.next
    binding.pry
    new_object = Pokemon.new(row[0],row[1],row[2])
    new_object
  end
end
