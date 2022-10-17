# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Booking, type: :model do
  subject do
    described_class.new(
      id: 1,
      name: 'Anything',
      email: 'test@test.com',
      start_date: DateTime.now,
      end_date: DateTime.now + 1.week
    )
  end
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid with wrong email format' do
    subject.email = 'test@test,com'
    expect(subject).to_not be_valid
  end
  it 'is not valid with end_date before start date' do
    subject.start_date = DateTime.now
    subject.end_date = DateTime.now - 1.week
    expect(subject).to_not be_valid
  end
end
