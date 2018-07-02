require 'rails_helper'

RSpec.describe Room, type: :model do
  let (:room) { FactoryBot.build(:room) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:location) }
  it { is_expected.to have_many(:appointments) }
  it { is_expected.to have_many(:users) }
end
