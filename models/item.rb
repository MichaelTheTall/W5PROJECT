require_relative('../db/sql_runner.rb')
require_relative('manufacturer.rb')
require('pry-byebug')

class Item

  attr_accessor(:id, :name, :man_id, :info, :stock, :cost, :sale)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @man_id = options['man_id'].to_i
    @info = options['info']
    @stock = options['stock'].to_i
    @cost = options['cost'].to_i
    @sale = options['sale'].to_i
  end

  def save()
    sql = "INSERT INTO items
    (
      name,
      man_id,
      info,
      stock,
      cost,
      sale
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name, @man_id, @info, @stock, @cost, @sale]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE items
    SET
    (
      name,
      man_id,
      info,
      stock,
      cost,
      sale
    )
    =
    (
      $1, $2, $3, $4, $5, $6
    )
    WHERE id = $7"
    values = [@name, @man_id, @info, @stock, @cost, @sale, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM items"
    results = SqlRunner.run(sql)
    return results.map {|i| Item.new(i)}
  end

  def self.find(id)
    sql = "SELECT * FROM items
    WHERE id = $1"
    values = [id]
    i = SqlRunner.run(sql, values)
    result = Item.new(i.first)
    return result
  end

  def manufacturer()
    sql = "SELECT * FROM manufacturers
    WHERE id = $1"
    values = [@man_id]
    results = SqlRunner.run(sql, values)
    # binding.pry()
    return results[0]["name"]
    # return results[:name]
  end

  def profit()
    result = @sale - @cost
    return result
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

  def delete()
    sql = "DELETE FROM items
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def warning()
    return "HIGH" if @stock >= 20
    return "MEDIUM" if @stock >= 10
    return "LOW" if @stock >= 1
    return "OUT OF STOCK" if @stock >= 0
  end

end
