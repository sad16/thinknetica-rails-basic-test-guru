module Badges
  class AttemptRuleService < BaseRuleService
    alias_method :attempts_count, :value

    private

    def perform_check
      user.test_attempts_count(test) == attempts_count.to_i
    end

    def guard_check_passed?
      true
    end
  end
end
