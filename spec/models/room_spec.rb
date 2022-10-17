# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Room, type: :model do
  subject do
    described_class.new(
      id: 1,
      name: 'Anything',
      description: 'Anything Anything Anything',
      price: 100
    )
  end
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
