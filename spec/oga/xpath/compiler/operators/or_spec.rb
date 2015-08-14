require 'spec_helper'

describe Oga::XPath::Compiler do
  describe 'or operator' do
    before do
      @document = parse('<root><a>1</a><b>1</b></root>')
    end

    it 'returns true if both boolean literals are true' do
      evaluate_xpath(@document, 'true() or true()').should == true
    end

    it 'returns true if one of the boolean literals is false' do
      evaluate_xpath(@document, 'true() or false()').should == true
    end

    it 'returns true if the left node set is not empty' do
      evaluate_xpath(@document, 'root/a or root/x').should == true
    end

    it 'returns true if the right node set is not empty' do
      evaluate_xpath(@document, 'root/x or root/b').should == true
    end

    it 'returns true if both node sets are not empty' do
      evaluate_xpath(@document, 'root/a or root/b').should == true
    end

    it 'returns false if both node sets are empty' do
      evaluate_xpath(@document, 'root/x or root/y').should == false
    end
  end
end
