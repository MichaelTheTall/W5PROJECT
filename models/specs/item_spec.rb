require("minitest/autorun")
require_relative("../item.rb")

class TestItem < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "Floppotron", "man_id" => "3",
    "info" => "Flops with the best!", "stock" => 5, "cost" => 100, "sale" => 300}

    @item1 = Item.new(options)
  end

  def test_name()
    result = @item1.first_name()
    assert_equal("Floppotron", result)
  end

  def test_man_id()
    result = @item1.man_id()
    assert_equal(3, result)
  end

  def test_info()
    result = @item1.info()
    assert_equal("Flops with the best!", result)
  end

  def test_stock()
    result = @item1.stock()
    assert_equal(5, result)
  end

  def test_cost()
    result = @item1.cost()
    assert_equal(100, result)
  end

  def test_sale()
    result = @item1.sale()
    assert_equal(300, result)
  end

  def test_profit()
    result = @item1.profit()
    assert_equal(200, result)
  end

end
