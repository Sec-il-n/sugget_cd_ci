require 'aws-sdk-rails'

if Rails.env.test?
  Aws.config[:stub_responses] = true
end

# Aws.config[:s3] = {
#   access_key_id:  "TESTKEY",
#   secret_access_key: "TESTSECRET",
#   stub_requests: true,
#   stub_responses: {
#
#   }
}
