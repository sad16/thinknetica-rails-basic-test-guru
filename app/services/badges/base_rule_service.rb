module Badges
  class BaseRuleService
    attr_reader :value, :user, :test

    def initialize(value, test_passage)
      @value = value
      @user = test_passage.user
      @test = test_passage.test
    end

    def call
      raise NotImplementedError
    end

    def check_rule?
      raise NotImplementedError
    end
  end
end
