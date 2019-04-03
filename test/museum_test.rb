require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'
require './lib/patron'
require './lib/museum'

class MuseumTest < MiniTest::Test
  def setup
    @dmns = Museum.new('Denver Museum of Nature and Science')
    @gems_and_minerals = Exhibit.new('Gems and Minerals', 0)
    @dead_sea_scrolls = Exhibit.new('Dead Sea Scrolls', 10)
    @imax = Exhibit.new('IMAX', 15)
    @bob = Patron.new('Bob', 20)
    @sally = Patron.new('Sally', 20)
  end

  def test_museum_class_exists
    assert_instance_of Museum, @dmns
  end

  def test_museum_has_a_name
    assert_equal 'Denver Museum of Nature and Science', @dmns.name
  end

  def test_museum_begins_with_no_exhibits
    assert_equal [], @dmns.exhibits
  end

  def test_museum_can_add_exhibits
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    assert_equal [@gems_and_minerals, @dead_sea_scrolls, @imax], @dmns.exhibits
  end

  def test_museum_recommends_exhibits_based_on_patron_interests
    @bob.add_interest('Dead Sea Scrolls')
    @bob.add_interest('Gems and Minerals')
    @sally.add_interest('IMAX')
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@imax)
    assert_equal [@dead_sea_scrolls, @gems_and_minerals], @dmns.recommend_exhibits(@bob)
    assert_equal [@imax], @dmns.recommend_exhibits(@sally)
  end

  def test_museum_has_patrons
    @dmns.admit(@bob)
    @dmns.admit(@sally)
    assert_equal [@bob, @sally], @dmns.patrons
  end

  def test_museum_can_recommended_patron_for_exhibit
    @bob.add_interest('Dead Sea Scrolls')
    @bob.add_interest('Gems and Minerals')
    @sally.add_interest('IMAX')
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@imax)
  end
end
