require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'
require './lib/patron'

class ExhibitTest < MiniTest::Test
  def setup
    @exhibit = Exhibit.new('Gems and Minerals', 0)
  end

  def test_exhibit_class_exists
    assert_instance_of Exhibit, @exhibit
  end

  def test_exhibit_has_a_name
    assert_equal 'Gems and Minerals', @exhibit.name
  end

  def test_exhibit_cost_starts_at_zero
    assert_equal 0, @exhibit.cost
  end  

end
