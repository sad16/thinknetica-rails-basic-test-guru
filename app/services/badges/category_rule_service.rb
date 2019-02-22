module Badges
  class CategoryRuleService < BaseRuleService
    alias_method :category_title, :value

    def call
      Test.category(category_title).count == user.tests_by_category(category_title).count if check_rule?
    end

    def check_rule?
      test.category.title == category_title
    end
  end
end
