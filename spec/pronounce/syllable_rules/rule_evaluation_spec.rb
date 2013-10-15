require 'spec_helper'
require 'pronounce/syllable_rules/rule_evaluation'

module Pronounce::SyllableRules
  describe RuleEvaluation do
    it 'does not allow creation of new instances' do
      expect { RuleEvaluation.new }.to raise_error NoMethodError
    end

    it 'evaluates a rule definition for a context' do
      result = true
      expect(RuleEvaluation.result_for proc { context }, result).to eq result
    end

    context 'DSL:' do
      describe 'verbatim' do
        it 'wraps a block that exposes the context' do
          result = true
          definition = proc { verbatim {|context| context } }
          expect(RuleEvaluation.result_for definition, result).to eq result
        end
      end
    end

  end
end
