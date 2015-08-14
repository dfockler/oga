require 'spec_helper'

describe Oga::XPath::Compiler do
  describe 'concat() function' do
    before do
      @document = parse('<root><a>foo</a><b>bar</b></root>')
    end

    it 'concatenates two strings' do
      evaluate_xpath(@document, 'concat("foo", "bar")').should == 'foobar'
    end

    it 'concatenates two integers' do
      evaluate_xpath(@document, 'concat(10, 20)').should == '1020'
    end

    it 'concatenates two floats' do
      evaluate_xpath(@document, 'concat(10.5, 20.5)').should == '10.520.5'
    end

    it 'concatenates two node sets' do
      evaluate_xpath(@document, 'concat(root/a, root/b)').should == 'foobar'
    end

    it 'concatenates a node set and a string' do
      evaluate_xpath(@document, 'concat(root/a, "baz")').should == 'foobaz'
    end
  end
end
