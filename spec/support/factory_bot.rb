require "support/active_storage_helpers"

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

# Makes these helpers available within factory definitions
FactoryBot::SyntaxRunner.include ActiveStorageHelpers
