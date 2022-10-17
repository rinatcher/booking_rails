# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  subject do
    described_class.new(
      id: 1,
      name: 'Anything',
      email: 'test@test.com',
      description: 'Anything Anything Anything'
    )
  end
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid with wrong email format' do
    subject.email = 'test_test.com'
    expect(subject).to_not be_valid
  end
  it 'is not valid with short description' do
    subject.description = 'test'
    expect(subject).to_not be_valid
  end
end
