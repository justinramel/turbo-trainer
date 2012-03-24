require "support/integration"

module Support
  class IntegrationSpec < MiniTest::Spec
    include Rails.application.routes.url_helpers
    include Capybara::DSL
    include Integration

    before do
      DatabaseCleaner.start
    end

    after do
      Capybara.reset_sessions!
      DatabaseCleaner.clean
    end
  end

  MiniTest::Spec.register_spec_type(/Integration$/i, Support::IntegrationSpec)
end