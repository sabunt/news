require 'rails_helper'

describe HotNew do
  it 'should be valid' do
    n = HotNew.new(title: 'text', description:'some text', deadline: Time.now + 1.hour)
    expect(n).to be_valid
  end

  it 'should not be valid' do
    n = HotNew.new(title: 'text', description:'some text', deadline: Time.now - 1.hour)
    expect(n).to_not be_valid
  end
end
