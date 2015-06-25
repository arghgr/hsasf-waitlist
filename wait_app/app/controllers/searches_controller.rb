class SearchesController < ApplicationController
  def index
    @waitlist_array = get_waitlist
  end

  def create
    @waitlist_array = get_waitlist
    @user_bday = parse_bday(params[:birthdate])
    @matches = get_waitlist_number(@waitlist_array, @user_bday)
  end

  def show
  end

  private

  def get_waitlist
    waitlist_data = RestClient.get('https://data.sfgov.org/resource/w4sk-nq57.json')
    waitlist_array = JSON.parse(waitlist_data.body)
    return waitlist_array
  end

  def parse_bday(bday)
    date = bday[5..9]
    year = bday[0..3]
    return date + '-' + year
  end

  def get_waitlist_number(waitlist, bday)
    matches = []
    waitlist.each do |entry|
      if entry["dob"] == bday
        matches.push(entry)
      end
    end
    return matches
  end

end
