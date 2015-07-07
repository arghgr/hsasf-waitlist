# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  phone                  :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  caseid                 :integer
#

class User < ActiveRecord::Base
  validates_presence_of :name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


def self.current_wait_list
  waitlist_data = RestClient.get('https://data.sfgov.org/resource/w4sk-nq57.json')
    waitlist_array = JSON.parse(waitlist_data.body)
    return waitlist_array
end

def self.email_top_100
  waitlist = current_wait_list
  waitlist.map do |entry|
    if entry["position_number"].to_i <= 100
      unless User.where(caseid: entry["caseid"]).first.nil?
        user = User.where(caseid: entry["caseid"]).first
        if user["caseid"].nil?
          puts "IT'S NIL"
        else
          UserMailer.waitlist_alert(user, entry).deliver_now
        end
      end
    end
  end
end


end
