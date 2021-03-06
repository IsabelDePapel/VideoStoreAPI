require "test_helper"

describe Rental do
  describe "validations" do
    it "must have a due date" do
      rental = rentals(:one)
      rental.due_date = nil
      rental.valid?.must_equal false
    end
  end

  describe "record persistence" do
    it "must persist a rental even if movie is deleted" do
      start_count = Rental.count
      rental = rentals(:one)
      Movie.destroy_all
      Rental.count.must_equal start_count
      rental.movie.must_equal nil
    end

    it "must persist a rental even if a customer is deleted" do
      start_count = Rental.count
      rental = rentals(:two)
      Customer.destroy_all
      Rental.count.must_equal start_count
      rental.customer.must_equal nil
    end
  end

  describe "checkin" do
    it "must turn the record to read-only after update" do
      rental = rentals(:one)
      rental.readonly?.must_equal false
      rental.checkin.must_equal true
      rental.readonly?.must_equal true
    end
  end
end
