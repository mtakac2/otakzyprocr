require 'test_helper'

class CitizensMailerTest < ActionMailer::TestCase
  test "registraion" do
    mail = CitizensMailer.registraion
    assert_equal "Registraion", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
