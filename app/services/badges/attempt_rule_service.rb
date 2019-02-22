module Badges
  class AttemptRuleService < BaseRuleService
    alias_method :attempts_count, :value

    def call
      test.test_passages.where(user: user).count == attempts_count.to_i if check_rule?
    end

    def check_rule?
      true
    end
  end
end
