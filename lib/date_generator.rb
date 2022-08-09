class DateGenerator
  class << self
    def generate_date(date)
      if date.nil?
        Date.today.strftime('%m%d%y')
      else
        date
      end
    end
  end
end
