module Badges
  class BaseRuleService
    attr_reader :value, :user, :test

    def initialize(value, test_passage)
      @value = value
      @user = test_passage.user
      @test = test_passage.test
    end

    def call
      perform_check if guard_check_passed?
    end

    private

    def perform_check
      raise NotImplementedError
    end

    def guard_check_passed?
      raise NotImplementedError
    end
  end
end
