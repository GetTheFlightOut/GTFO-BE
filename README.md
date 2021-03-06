# README
<!-- Shields -->
![](https://img.shields.io/badge/Rails-5.2.4-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a)
![](https://img.shields.io/badge/Ruby-2.5.3-orange)
![](https://img.shields.io/gem/v/sinatra)
![](https://img.shields.io/gem/v/fast_jsonapi)
![](https://img.shields.io/travis/com/GetThatFlightOut/GTFO-BE)
![](https://img.shields.io/github/contributors/GetThatFlightOut/GTFO-FE)
![](https://img.shields.io/badge/GetThatFlightOut-BE-green)
![](https://github.com/GetThatFlightOut/GTFO-FE/stargazers)
![](https://img.shields.io/github/issues/GetThatFlightOut/GTFO-BE)

# GTFO-BE
![image](https://user-images.githubusercontent.com/68172332/104384272-6d70f100-54ee-11eb-94ba-287258e83de7.png)

## Table of Contents
  - [What it does](#what-it-does)
  - [How to Install GTFO-BE](#how-to-install-gtfo-be)
  - [API Contract](#api-contract)
  - [Schema](#schema)
  - [Dependencies](#dependencies)
  - [Testing](#testing)
  - [Learning Goals](#learning-goals)
  - [Licenses](#licenses)
  - [Contact](#contact)
  - [Acknowledgments](#acknowledgments)

## What it does

This project part of a Service-Oriented Architecture (SOA) application that provides users with flight and weather information based on search parameters that the user provides. The GTFO-BE serves as an intermediary from the GTFO-FE repo and the Weather-API and Flight-API repos. This service collects data from both the Weather and Flight APIs and compiles the data into one service that the front end can call.

To view the production site, please visit the [GTFO link](https://gtfo-fe.herokuapp.com/).

To view the other components of the application please visit the [Github Project Organization](https://github.com/GetTheFlightOut).

## How to Install GTFO-BE

For usage on your local machine follow the instructions listed below:

```
git clone git@github.com:GetThatFlightOut/GTFO-BE.git
cd GTFO-BE
bundle install
rake db:{create,migrate}
figaro install
  #setup ENV variables in application.yml
    #FLIGHT_API_HOST: "https://flight-api-service.herokuapp.com/"
    #WEATHER_API_HOST: "https://gtfo-weather-api.herokuapp.com/"
rails s
get calls to: localhost:3000 in your web browser
```

## API Contract

To see an example response like that below you can use [Postman](https://www.postman.com/) to send a GET request to our BE hosted on Heroku here: https://gtfo-be.herokuapp.com/api/v1/search

Required parameters:

`:departure_airport` - (string) - the IATA code of the origin airport

`:departure_date` - (string) - %d/%m/%y - the earliest date considered for departing flight

`:trip_duration` - (integer) - the number of days planned for the round trip

`:limit` - (integer) - the maximum number of results to be returned (default is currently 20 fo the index page)

Sample view of an API call in Postman:
![trips_call](https://user-images.githubusercontent.com/7945439/104528708-391c3400-55c5-11eb-807d-b95c37e0a4ae.png)


This is an example of an error response for Invalid Data (Missing/Incorrect)
```
{
"error": "Invalid Data",
"status": 400
}
```

### Asynchronous API Calls

Due to the sheer amount of data returned from the two APIs, our team decided to implement asynchronous threads with the Rails Executor. This operation allows GTFO to handle multiple HTTP requests simultaneously by running multiple threads, up to 20, to reduce response time by 50%.

 <p align="center">
 <img src="https://i.imgur.com/JuoqyFa.png">
 </p>

## Schema

 <p align="center">
 <img src="https://i.imgur.com/OW5QQGw.png">
  </p>


## Dependencies

 * figaro
 * faraday
 * fast_jsonapi
 * travis
 * webmock
 * vcr
 * shoulda-matchers
 * simplecov

## Testing

* For testing our team implemented Travis CI with RSpec

> Travis CI is cloud based and when we submit a pull request, Travis will attempt to build our project and run the tests to ensure everything is working as expected.

> RSpec is a tool for unit testing that will ensure we have the intended functionality at each level of our code.

* In order to run the tests, run `bundle exec rspec` in the command line and you should have all passing tests.

## Learning Goals

  * Consume two external APIs

  * Build API's that return JSON responses

  * Refactor code for better code for improved organization/readability

  * Practice project management with project boards/daily standups/group retros

  * Utilize workflow: small commits, descriptive pull requests and code review

  * Write thorough and understandable documentation

  * Utilize a Service-Oriented Architecture with a front-end, a back-end, and at least one micro-service

## Licenses

  * Ruby 2.5.3
  * Rails 2.5.4.3
  * Travis CI Enterprise

## Contact

#### Todd Estes: [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/toddwestes/), [Email](mailto:elestes@gmail.com), [GitHub](https://github.com/Todd-Estes)

#### Connor Ferguson: [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/connor-p-ferguson/), [Email](mailto:cpfergus1@gmail.com), [GitHub](https://github.com/cpfergus1)

#### George Soderholm: [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/george-soderholm-05776947/), [Email](mailto:georgesoderholm@gmail.com), [GitHub](https://github.com/GeorgieGirl24)

#### Sage Freeman-Gonzales: [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/sagefreemangonzales/), [Email](mailto:sagegonzales15@gmail.com), [GitHub](https://github.com/SageOfCode)

#### Sheryl Stillman: [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/sherylstillman1/), [Email](mailto:sheryl.stillman@gmail.com), [GitHub](https://github.com/stillsheryl)

#### Aidan Murray:  [![LinkedIn][linkedin-shield]](http://www.linkedin.com/in/aidan-murray-teknoserval), [Email](mailto:aidanhansm@gmail.com), [GitHub](https://github.com/TeknoServal)

#### Jesse Mellinger: [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/jesse-mellinger/), [Email](mailto:jesse.m.mellinger@gmail.com), [GitHub](https://github.com/JesseMellinger)

#### Nick King: [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/nick-king-3128501ba/), [Email](mailto:nickmaxking@gmail.com), [GitHub](https://github.com/nmking22)

#### Brian Liu: [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/brian-liu-8356287b/), [Email](mailto:brian.b.liu@gmail.com), [GitHub](https://github.com/the-color-bliu)

#### Will Dunlap: [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/willwdunlap/), [Email](mailto:dunlapww@gmail.com), [GitHub](https://github.com/dunlapww)

## Acknowledgments

Thank you to Ian Douglas and Dione Wilson for being such amazing instructors and guiding us through this project!

<!-- MARKDOWN LINKS -->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
