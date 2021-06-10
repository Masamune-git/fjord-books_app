# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @report = reports(:alice_report)
    @alice = users(:alice)
    @bob = users(:bob)
  end

  test '#created_on' do
    assert_equal DateTime.current.to_date, @report.created_on
  end

  test '#editable?' do
    assert @report.editable?(@alice)
    assert_not @report.editable?(@bob)
  end
end
