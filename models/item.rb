require_relative( '../db/sql_runner' )

class Item

  attr_reader(:id, :name, :man_id, :info, :stock, :cost, :sale, :profit)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @man_id = options['man_id'].to_i
    @info = options['info']
    @stock = options['stock'].to_i
    @cost = options['cost'].to_i
    @sale = options['sale'].to_i
    @profit = options['profit'].to_i
  end

  def save()
    sql = "INSERT INTO items
    (
      name,
      man_id,
      info,
      stock,
      cost,
      sale,
      profit
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    RETURNING id"
    values = [@name, @man_id, @info, @stock, @cost, @sale, @profit]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM items"
    results = SqlRunner.run(sql)
    return results.map {|i| Item.new(i)}
  end

  def manu()
    sql = "SELECT * FROM manufacturers
    WHERE id = $1"
    values = [@man_id]
    results = SqlRunner.run(sql, values)
    return Manufacturer.new(results.first)
  end

  def self.delete_all()
    sql = "DELETE FROM items"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM items
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

end
