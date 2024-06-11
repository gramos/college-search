require "test_helper"

class GeoTest < ActiveSupport::TestCase

  test "the truth" do
    points = [{ 'location.lat' => 50, 'location.lon' => 60 },
              { 'location.lat' => 70, 'location.lon' => -60 },
              { 'location.lat' => 34, 'location.lon' => 60 },
              { 'location.lat' => 34, 'location.lon' => -80 }]

    expected = {"lat"=>69.36839237710977, "lon"=>8.76335661424886}
    assert_equal(expected, Geo.calculate_center(points))
  end
end
