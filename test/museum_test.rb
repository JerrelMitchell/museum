require 'minitest/autorun'
require 'minitest/pride'
require './lib/museum'
require 'pry'

class MuseumTest < Minitest::Test
  def test_it_exists
    museum = Museum.new("dmns")
    assert_instance_of Museum, museum
  end

  def test_it_has_a_name
    dmns = Museum.new("Denver Museum of Nature and Science")
    expected = "Denver Museum of Nature and Science"
    assert_equal expected, dmns.name
  end

  def test_it_can_add_an_exhibit
    dmns = Museum.new("Denver Museum of Nature and Science")
    dmns.add_exhibit("Dead Sea Scrolls", 10)
  end
end
