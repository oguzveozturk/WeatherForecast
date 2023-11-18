#  #  # Table of Contents
1. [Description](#description)
2. [Getting started](#getting-started)
3. [Usage](#usage)
4. [Arhitecture](#arhitecture)
5. [Structure](#structure)
6. [Running the tests](#running-the-tests)
7. [Deployment](#deployment)
8. [Dependencies](#dependencies)
9. [Task board](#task-board)
10. [Design](#design)
11. [API](#api)

# WeatherForecast
A simple project that shows weather forecast.

# Description
<p>Users can view the 7-day weather forecast either by searching or by using their location through the OpenWeather API.</p>

# Getting started
<p>
1. Make sure you have the Xcode version 14.0 or above installed on your computer.<br>
2. Make sure iOS or iPadOS version 15.0 or above.<br>
2. Download the WeatherForecast project files from the repository.<br>
3. Open the project files in Xcode.<br>
4. Run the WeatherForecast scheme.<br>

# Usage
In order to get forecasts you need an account from openweathermap.org. But for the simplicty project contains a key.

# Architecture
* WeatherForecast project is implemented using the <strong>VIPER</strong> architecture pattern.
* All the logic is handled within the presenter..<br>

# Structure
* "WeatherForecast": Begining of the app.Contains AppDelegate, AppRouter and AppContainer. 
* "ForecastSearchModule": Creates search request via searchbar and lists them.
* "WeatherAPI": Derived from NetworkService. Contains endpoints and decoder models.
* "NetworkService": Files or classes related to communicating with an external API. This could include code for making HTTP requests to a web server, parsing responses, and handling any errors that may occur.
* "LocationManager": Can gets user location and finds the coordinates of the written location.
* "Cache": Saves the latest datas for given amount of time.
* "Common": Files or resources that are shared across multiple parts of the project. Such as utility classes, global constants or extensions.

# Running the tests
<p>The WeatherForecast project can be tested using the built-in framework XCTest.<br>
Just select the testing tab and press start.<br>

# Dependencies
[SPM] is used as a dependency manager.
List of dependencies: 
* 'Kingfisher' -> Image caching library.

# Workflow

* Reporting bugs:<br> 
If you come across any issues while using the WeatherForecast, please report them by creating a new issue on the GitHub repository.

* Reporting bugs form: <br> 
```
App version: 2.12
iOS version: 17.1
Description: When I tap on the "Send" button, my friends don't receive message.
Steps to reproduce: Open "Messages" flow of the app, write down message, press "Send" button.
```

* Submitting pull requests: <br> 
If you have a bug fix or a new feature you'd like to add, please submit a pull request. Before submitting a pull request, 
please make sure that your changes are well-tested and that your code adheres to the Swift style guide.

* Improving documentation: <br> 
If you notice any errors or areas of improvement in the documentation, feel free to submit a pull request with your changes.

* Providing feedback:<br> 
If you have any feedback or suggestions for the WeatherForecast project, please let us know by creating a new issue or by sending an email to the project maintainer.

# API 
* We are using a REST API from OpenWeather-API
* List of API calls is [here](https://openweathermap.org/api) 
* For Image caching we are using [Kingfisher](https://github.com/onevcat/Kingfisher) 
