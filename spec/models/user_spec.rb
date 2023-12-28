# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context "when there are guest users older than 7 days" do
    before do
      # There's an initial user that we don't want
      described_class.find_each(&:destroy)
      Timecop.freeze(Time.now.utc - 10.days) do
        FactoryBot.create_list(:guest_patron, 100, guest: true)
        FactoryBot.create_list(:user, 10)
      end
      FactoryBot.create_list(:guest_patron, 10)
    end

    it "expires them" do
      expect { described_class.expire_guest_accounts }.to change(described_class, :count).by(-100)
    end
  end

  context 'with CAS authorization only' do
    let(:access_token) { OmniAuth::AuthHash.new(provider: "provider", uid: "testUSER123") }

    it "finds or creates user in the database" do
      expect { described_class.from_cas(access_token) }.to change(described_class, :count).by(1)
    end
  end
end
