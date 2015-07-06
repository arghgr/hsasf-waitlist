require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "waitlist_alert" do
    mail = UserMailer.waitlist_alert
    assert_equal "Waitlist alert", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "signup_alert" do
    mail = UserMailer.signup_alert
    assert_equal "Signup alert", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
