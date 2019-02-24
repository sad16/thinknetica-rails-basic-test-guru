module Badges
  class LevelRuleService < BaseRuleService
    alias_method :level, :value

    private

    def perform_check
      Test.level(level).count == user.successful_tests.level(level).distinct.count
    end

    def guard_check_passed?
      test.level == level.to_i
    end
  end
end
