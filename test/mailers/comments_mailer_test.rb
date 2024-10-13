require "test_helper"

class CommentsMailerTest < ActionMailer::TestCase
  test "submitted" do
    mail = CommentsMailer.submitted comments(:one)
    assert_equal "New comment", mail.subject
    assert_equal [ "blog@gojoe.dev" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
  end
end
