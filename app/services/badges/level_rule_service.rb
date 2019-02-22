module Badges
  class LevelRuleService < BaseRuleService
    alias_method :level, :value

    def call
      Test.level(level).count == user.tests_by_level(level).count if check_rule?
    end

    def check_rule?
      test.level == level.to_i
    end
  end
end
