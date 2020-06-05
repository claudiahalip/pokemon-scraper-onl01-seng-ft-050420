class Pokemon
  
  attr_accessor:id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name 
    @type = type 
    @db = db
  end 
  
  def self.save (name, type, db) 
    sql = <<-SQL 
    INSERT INTO pokemon (name, type)
    VALUES (?, ?)
    SQL
    DB.execute(sql, name, type)
    # @id = DB[:conn].execute("SELECT last_insert_rowid()FROM pokemon")[0][0]
  end 
  
  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon
      WHERE id = ?
      SQL
    DB.execute(sql, id).flatten
    Pokemon.new(id: id, name: DB.execute(sql, id).flatten[1], type: DB.execute(sql, id).flatten[2], db: db)
    
        
  end
  
end
