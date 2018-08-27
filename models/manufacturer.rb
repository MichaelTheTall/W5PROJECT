require_relative('../db/sql_runner')

class Manufacturer

  attr_reader(:id, :name, :info)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @info = options['info']
  end

  def save()
    sql = "INSERT INTO manufacturers
    (
      name,
      info
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @info]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM manufacturers"
    results = SqlRunner.run(sql)
    return results.map {|i| Manufacturer.new(i)}
  end

  def items()
    sql = "SELECT * FROM items
    WHERE man_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|i| Item.new(i)}
  end

  def self.delete(id)
    sql = "DELETE FROM manufacturers
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

end
