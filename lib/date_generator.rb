require './spec_helper'

class DateGenerator
  def self.generate_date(date)
    if date.nil?
      Date.today.strftime('%m%d%y')
    else
      date
    end
  end
end
