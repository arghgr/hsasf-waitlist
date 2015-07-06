class SearchesController < ApplicationController
  def index
  end

  def create
    if params[:birthdate]
      @bday = parse_bday(params[:birthdate])
      @matches = get_dob_matches(@bday)
    elsif params[:caseid]
      @caseid = params[:caseid].to_s
      @matches = get_caseid_matches(@caseid)
    end
  end

  def show
  end

  def all
    @waitlist_array = get_waitlist
  end

  private

  def parse_bday(bday)
    date = bday[5..9]
    year = bday[0..3]
    return date + '-' + year
  end

end
