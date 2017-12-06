class Pokemon
  attr_accessor :id,:name,:type, :db,:hp
  @@all = []
  def initialize(id:,name:,type:,db:, hp:nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
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
    new_object = Pokemon.new(id:row[0],name:row[1],type:row[2],db:db)
    #binding.pry
    new_object
  end
  #def alter_hp(health,db)
  #   = db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",health,self.id)
  #end
end
