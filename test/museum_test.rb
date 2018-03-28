require 'minitest/autorun'
require 'minitest/pride'
require './lib/museum'
require './lib/patron'
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

  def test_it_starts_with_zero_revenue
    dmns = Museum.new("Denver Museum of Nature and Science")
    assert_equal 0, dmns.revenue
  end

  def test_when_patron_is_admitted_10_dollars_of_revenue_is_generated
    dmns   = Museum.new("Denver Museum of Nature and Science")
    bob    = Patron.new("Bob")
    jerrel = Patron.new("Jerrel")
    dmns.admit(bob)
    assert_equal 10, dmns.revenue
    dmns.admit(jerrel)
    assert_equal 20, dmns.revenue

  end

  def test_revenue_is_generated_when_patron_visits_existing_exhibits
    dmns = Museum.new("Denver Museum of Nature and Science")
    dmns.add_exhibit("Dead Sea Scrolls", 10)
    dmns.add_exhibit("Gems and Minerals", 0)

    bob = Patron.new("Bob")
    bob.add_interest("Gems and Minerals")
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Imax")

    dmns.admit(bob)
    assert_equal 20, dmns.revenue

    dmns.admit(bob)
    assert_equal 40, dmns.revenue
  end

  def test_multiple_visiting_patrons_generate_revenue
    dmns = Museum.new("Denver Museum of Nature and Science")
    dmns.add_exhibit("Dead Sea Scrolls", 10)
    dmns.add_exhibit("Gems and Minerals", 0)
    dmns.add_exhibit("Horses In The West", 15)
    dmns.add_exhibit("Painting On Water", 20)

    bob = Patron.new("Bob")
    bob.add_interest("Horses In The West")
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Imax")

    dmns.admit(bob)
    assert_equal 35, dmns.revenue

    jerrel = Patron.new("Jerrel")
    jerrel.add_interest("Gems and Minerals")
    jerrel.add_interest("Dead Sea Scrolls")
    jerrel.add_interest("Painting On Water")

    dmns.admit(jerrel)
    assert_equal 75, dmns.revenue
  end

  def test_lists_array_of_patron_names_admitted_to_exhibit
    dmns = Museum.new("Denver Museum of Nature and Science")
    dmns.add_exhibit("Dead Sea Scrolls", 10)
    dmns.add_exhibit("Gems and Minerals", 0)
    dmns.add_exhibit("Horses In The West", 20)

    exhibit1 = "Horses In The West"
    exhibit2 = "Dead Sea Scrolls"
    exhibit3 = "Gems and Minerals"

    bob = Patron.new("Bob")
    bob.add_interest("Horses In The West")
    bob.add_interest("Dead Sea Scrolls")
    dmns.admit(bob)

    assert_equal ["Bob"], dmns.patrons_of(exhibit1)

    jerrel = Patron.new("Jerrel")
    jerrel.add_interest("Dead Sea Scrolls")
    dmns.admit(jerrel)

    assert_equal ["Bob", "Jerrel"], dmns.patrons_of(exhibit2)
    assert_equal [], dmns.patrons_of(exhibit3)
  end

end
