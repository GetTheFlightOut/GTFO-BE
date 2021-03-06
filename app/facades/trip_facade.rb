class TripFacade
  def self.get_trips(flight_params)
    flights = FlightService.get_flights(flight_params)
    @trips = []

    if flights[:message].nil?
      threads = []

      flights[:data].each_with_index do |flight, index|
        threads << Thread.new do
          Rails.application.executor.wrap do
            t = Thread.current

            lat = flight[:attributes][:latitude]
            long = flight[:attributes][:longitude]

            puts "#{lat}, #{long}, #{flight[:attributes][:city]}"

            weather = WeatherFacade.get_updated_weather(lat, long)

            t[:trip] = Trip.new_trip(flight, weather, index)

            connection = ActiveRecord::Base.connection
            ActiveRecord::Base.remove_connection(connection)
          end
        end
      end

      threads.map(&:value).flatten
      threads.each do |t|
        @trips << t[:trip]

        t.exit
      end

      @trips # return value: an array of Trip Objects

    else
      flights
    end
  end
end
