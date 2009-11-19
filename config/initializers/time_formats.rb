ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS[:hour24] = lambda { |time| time.strftime("%k:%M") }
ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS[:short_date] = lambda { |time| time.strftime("%d %b") }
