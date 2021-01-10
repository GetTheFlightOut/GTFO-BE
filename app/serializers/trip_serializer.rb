class TripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :origin_city,
             :destination_city,
             :origin_iata,
             :destination_iata,
             :latitude,
             :longitude,
             :price,
             :departure_datetime,
             :arrival_datetime,
             :r_departure_datetime,
             :r_arrival_datetime,
             :booking_link,
             :trip_duration,
             :id
             :min_f
             :max_f
             :min_c
             :max_c
             :day_feels_like_f
             :day_feels_like_c
             :description
             :date
             :chance_precip
             :sky_coverage
             :is_available
end