class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def get_waitlist
    waitlist_data = RestClient.get('https://data.sfgov.org/resource/w4sk-nq57.json')
    waitlist_array = JSON.parse(waitlist_data.body)
    return waitlist_array
  end

  def get_dob_matches(bday)
    waitlist = get_waitlist
    matches = []
    waitlist.each do |entry|
      if entry["dob"] == bday
        matches.push(entry)
      end
    end
    return matches
  end

  def get_caseid_matches(caseid)
    waitlist = get_waitlist
    matches = []
    waitlist.each do |entry|
      if entry["caseid"] == caseid
        matches.push(entry)
      end
    end
    return matches
  end

end
