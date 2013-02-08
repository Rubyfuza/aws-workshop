require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  def test_welcome_email
    user = users(:one)

    # Send the email, then test that it got queued
    email = UserMailer.welcome_email(user).deliver
    assert !ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal [user.email], email.to
    assert_equal 'Welcome to Chirp', email.subject
    # Check for login link HTML tag
    assert_match(/href/, email.encoded)
    # Check for text format message title
    assert_match(/Welcome to Chirp, #{user.name}/, email.encoded)
  end
end
