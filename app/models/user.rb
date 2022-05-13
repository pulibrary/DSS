class User < ApplicationRecord

  # Connects this user object to Blacklights Bookmarks.
  include Blacklight::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable

  # Method added by Blacklight; Blacklight uses #to_s on your
  # user class to get a user-displayable login/identifier for
  # the account.
  def to_s
    username || 'User'
  end

  def self.from_cas(access_token)
    User.where(provider: access_token.provider, uid: access_token.uid).first_or_create do |user|
      user.uid = access_token.uid
      user.username = access_token.uid
      user.email = "#{access_token.uid}@princeton.edu"
      user.password = SecureRandom.urlsafe_base64
      user.provider = access_token.provider
    end
  end

  # Alternative to the implementation used in devise-guests, due to memory use
  # problems when running that task
  # https://github.com/cbeer/devise-guests/blob/7ab8c55d7a2b677ce61cc83486d6e3723d8795b2/lib/railties/devise_guests.rake
  def self.expire_guest_accounts
    User
      .where("guest = ? and updated_at < ?", true, Time.now.utc - 7.days)
      .find_each(batch_size: 25_000, &:destroy)
  end
end
