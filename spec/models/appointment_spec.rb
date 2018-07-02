require 'rails_helper'

RSpec.describe Appointment, type: :model do
  let (:appointment) { FactoryBot.build(:appointment) }
  it { is_expected.to validate_presence_of(:start_time) }
  it { is_expected.to validate_presence_of(:appointment_date) }
  it { is_expected.to belong_to(:room) }
  it { is_expected.to belong_to(:user) }
end