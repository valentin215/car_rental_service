require "minitest/autorun"
require "json"

class Level5JsonComparisonTest < Minitest::Test
  def setup
    @expected_output = JSON.parse(File.read("level5/data/expected_output.json"), symbolize_names: true)
    @result_output = JSON.parse(File.read("level5/data/result.json"), symbolize_names: true)
  end

  def test_json_output_matches_expected
    assert_equal @expected_output, @result_output
  end
end
