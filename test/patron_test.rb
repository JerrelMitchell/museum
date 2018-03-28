require 'minitest/autorun'
require 'minitest/pride'
require './lib/patron'
require 'pry'

class PatronTest < Minitest::Test
  def test_it_exists
    patron = Patron.new("Bob")
    assert_instance_of Patron, patron
  end

  def test_it_has_a_name
    patron = Patron.new("Jerrel")
    assert_equal "Jerrel", patron.name
  end

  def test_it_can_have_a_different_name
    patron = Patron.new("Bob")
    assert_equal "Bob", patron.name
  end

  def test_it_can_have_interests
    patron = Patron.new("Jerrel")
    assert_equal [], patron.interests
  end

  def test_it_can_add_an_interest
    patron = Patron.new("Jerrel")
    patron.add_interests("Hiking")

    assert_equal ["Hiking"], patron.interests
  end

  def test_it_has_multiple_interests
    patron = Patron.new("Jerrel")
    patron.add_interests("Hiking")
    patron.add_interests("Gaming")
    assert_equal ["Hiking", "Gaming"], patron.interests
  end
end
