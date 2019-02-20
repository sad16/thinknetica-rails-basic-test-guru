module Badges
  class CategoryRuleService < BaseRuleService
    def call
      all_test_ids = Test.category(value).pluck(:id)
      user_test_ids = user.tests_by_category(value).select { |test|
        user.test_successful?(test)
      }.uniq.pluck(:id)

      all_test_ids.sort == user_test_ids.sort
    end
  end
end
