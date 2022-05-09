# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:uid) { |n| "uid#{n}" }
    email { "#{uid}@princeton.edu" }

    # for patrons without a net ID
    factory :guest_patron do
      sequence(:uid) { srand.to_s[2..15] }
      sequence(:username) { "Guest" }
    end
  end
end
