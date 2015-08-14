require 'spec_helper'

describe Oga::XPath::Compiler do
  describe 'and operator' do
    before do
      @document = parse('<root><a>1</a><b>1</b></root>')
    end

    it 'returns true if both boolean literals are true' do
      evaluate_xpath(@document, 'true() and true()').should == true
    end

    it 'returns false if one of the boolean literals is false' do
      evaluate_xpath(@document, 'true() and false()').should == false
    end

    it 'returns true if both node sets are non empty' do
      evaluate_xpath(@document, 'root/a and root/b').should == true
    end

    it 'returns false if one of the node sets is empty' do
      evaluate_xpath(@document, 'root/a and root/c').should == false
    end

    it 'skips the right expression if the left one evaluates to false' do
      evaluator = described_class.new(@document)
      evaluator.should_not receive(:on_call_true)

      evaluator.evaluate('false() and true()').should == false
    end
  end
end
