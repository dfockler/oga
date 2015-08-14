require 'spec_helper'

describe Oga::XPath::Compiler do
  describe 'lower-than operator' do
    before do
      @document = parse('<root><a>10</a><b>20</b></root>')
    end

    it 'returns true if a number is lower than another number' do
      evaluate_xpath(@document, '10 < 20').should == true
    end

    it 'returns false if a number is not lower than another number' do
      evaluate_xpath(@document, '20 < 10').should == false
    end

    it 'returns true if a number is lower than a string' do
      evaluate_xpath(@document, '10 < "20"').should == true
    end

    it 'returns true if a string is lower than a number' do
      evaluate_xpath(@document, '"10" < 20').should == true
    end

    it 'returns true if a string is lower than another string' do
      evaluate_xpath(@document, '"10" < "20"').should == true
    end

    it 'returns true if a number is lower than a node set' do
      evaluate_xpath(@document, '10 < root/b').should == true
    end

    it 'returns true if a string is lower than a node set' do
      evaluate_xpath(@document, '"10" < root/b').should == true
    end

    it 'returns true if a node set is lower than another node set' do
      evaluate_xpath(@document, 'root/a < root/b').should == true
    end
  end
end
