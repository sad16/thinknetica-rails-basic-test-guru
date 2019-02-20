module Badges
  class RuleServiceFactory
    def self.build(badge, test_passage)
      service_name(badge).constantize.new(badge.rule_value, test_passage)
    end

    private

    def self.service_name(badge)
      "Badges::#{badge.rule_name.camelcase}RuleService"
    end
  end
end
