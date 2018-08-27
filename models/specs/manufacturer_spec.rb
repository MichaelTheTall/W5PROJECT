require("minitest/autorun")
require_relative("../manufacturer.rb")

class TestManufacturer < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "Floppomatic", "info" => "Takes the chops to makes the flops!"}

    @man1 = Manufacturer.new(options)
  end

  def test_name()
    result = @man1.name()
    assert_equal("Floppomatic", result)
  end

  def test_info()
    result = @man1.info()
    assert_equal("Takes the chops to makes the flops!", result)
  end

end
