require 'spec_helper'
describe 'thycotic' do
  context 'with default values for all parameters' do
    it { should contain_class('thycotic') }
  end
end
