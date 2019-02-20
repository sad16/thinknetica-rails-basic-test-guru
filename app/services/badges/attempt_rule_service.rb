module Badges
  class AttemptRuleService < BaseRuleService
    attr_reader :test

    def initialize(value, test_passage)
      super
      @test = test_passage.test
    end

    def call
      test.test_passages.where(user: user).count == value.to_i
    end
  end
end
