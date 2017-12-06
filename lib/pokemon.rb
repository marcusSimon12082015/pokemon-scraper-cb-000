class Pokemon
  attr_accessor :id,:name,:type, :db
  def initialize(id:,name:,type:,db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  def self.save(id,name,type,db)
    db.execute("INSERT INTO pokemon VALUES(?,?,?)",1,name,type)
  end
end
