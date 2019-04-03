require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'
require './lib/patron'

class PatronTest < MiniTest::Test
  def setup
    @bob = Patron.new('Bob', 20)
    @sally = Patron.new('Sally', 20)
  end

  def test_patron_class_exists
    assert_instance_of Patron, @bob
  end

  def test_patron_has_a_name
    assert_equal 'Bob', @bob.name
  end

  def test_patron_has_spending_money
    assert_equal 20, @bob.spending_money
  end

  def test_patron_starts_with_no_interests
    assert_equal [], @bob.interests
  end

  def test_patron_can_add_to_interests
    @bob.add_interest('Dead Sea Scrolls')
    @bob.add_interest('Gems and Minerals')
    @sally.add_interest('IMAX')
    assert_equal ['Dead Sea Scrolls', 'Gems and Minerals'], @bob.interests
    assert_equal ['IMAX'], @sally.interests
  end

  def test_museum_recommends_exhibits_based_on_patron_interests
    @bob.add_interest('Dead Sea Scrolls')
    @bob.add_interest('Gems and Minerals')
    @sally.add_interest('IMAX')
    assert_equal []
  end

end
