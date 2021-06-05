# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @report = reports(:alice_report)
  end
  test "#created_on" do
    assert_equal Date.current, @report.created_on
  end
  test "#created_on" do
    assert_equal Date.current, @report.created_on
  end
end
