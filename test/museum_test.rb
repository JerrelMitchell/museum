require 'minitest/autorun'
require 'minitest/pride'
require './lib/museum'
require 'pry'

class MuseumTest < Minitest::Test
  def test_it_exists
    museum = Museum.new
    assert_instance_of Museum, museum
  end

  def test_it_has_a_name
    dmns = Museum.new("Denver Museum of Nature and Science")
    expected = "Denver Museum of Nature and Science"
    assert_equal expected, dmns
  end

  def test_it_can_add_an_exhibit
    dmns = Museum.new("Denver Museum of Nature and Science")
    dmns.add_exhibit("Dead Sea Scrolls", 10)

    assert_equal 
  end

  def test_its_exhibits_have_a_name
    dmns = Museum.new("Denver Museum of Nature and Science")
    dmns.add_exhibit("Dead Sea Scrolls", 10)

    assert_equal "Dead Sea Scrolls", dmns.exibit_name
  end

  def test_exhibits_have_prices
    dmns = Museum.new("Denver Museum of Nature and Science")
    dmns.add_exhibit("Dead Sea Scrolls", 10)

    assert_equal 10, dmns.exibit_price
  end
end
