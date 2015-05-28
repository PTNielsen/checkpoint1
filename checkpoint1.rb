require 'minitest/autorun'
require 'pry'
require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class Book

  attr_reader :title, :price

    def initialize(title, price)
      @title = title
      @price = price
    end

end

class Cart

  def initialize
    @item_count = 0
    @my_cart = []
  end

  def add book
    @my_cart.push(book)
  end

  def item_count
    @my_cart.count 
  end

  def value
    total_value = 0
    @my_cart.each do | single_book |
      total_value += single_book.price
    end
    return total_value
  end

end

class ShoppingTest < MiniTest::Test
  def test_books_have_a_title_and_price
    b = Book.new "War & Peace", 25
    assert_equal "War & Peace", b.title
    assert_equal 25, b.price
  end

  def test_carts_can_hold_books
    cart = Cart.new
    assert_equal 0, cart.item_count

    cart.add Book.new("Great Expectations", 10)
    cart.add Book.new("Oh, The Places You'll Go!", 8)
    assert_equal 2, cart.item_count
  end

  def test_carts_can_find_the_total_cost
    cart = Cart.new
    cart.add Book.new("Great Expectations", 10)
    cart.add Book.new("Oh, The Places You'll Go!", 8)
    assert_equal 18, cart.value
  end
end