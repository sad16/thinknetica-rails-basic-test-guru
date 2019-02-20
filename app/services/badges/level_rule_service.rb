module Badges
  class LevelRuleService < BaseRuleService
    def call
      all_test_ids = Test.level(value).pluck(:id)
      user_test_ids = user.tests_by_level(value).select { |test|
        user.test_successful?(test)
      }.uniq.pluck(:id)

      all_test_ids.sort == user_test_ids.sort
    end
  end
end
