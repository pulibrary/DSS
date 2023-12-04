# # frozen_string_literal: true

namespace :users do
  task :add_admin_role, [:netid] => :environment do |_t, args|
    netid = args[:netid]
    puts netid
    user = User.find_by(uid: netid)
    user = User.create(uid: netid, email: "#{netid}@princeton.edu") if user.nil?
    user.role = 'admin'
    puts user.role
    user.save
  end

  task :remove_admin_role, [:netid] => :environment do |_t, args|
    netid = args[:netid]
    user = User.find_by(uid: netid)
    user = User.create(uid: netid, email: "#{netid}@princeton.edu") if user.nil?
    user.role = ''
    puts "role = ", user.role
    user.save
  end
end
