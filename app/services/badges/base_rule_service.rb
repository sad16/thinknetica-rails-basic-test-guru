module Badges
  class BaseRuleService
    attr_reader :value, :user

    def initialize(value, test_passage)
      @value = value
      @user = test_passage.user
    end

    def call
      raise NotImplementedError
    end
  end
end
