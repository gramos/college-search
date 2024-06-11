require "test_helper"

class CollegeApiTest < ActiveSupport::TestCase

  test "CollegeApi.search" do
    expected = {"metadata"=>{"page"=>0, "total"=>46, "per_page"=>1},
      "results"=>[{"school.name"=>"CUNY New York City College of Technology", "location.lat"=>40.695483, "location.lon"=>-73.987856}]}
    
    assert_equal(expected, CollegeApi.search('New York', 1))
  end
end
