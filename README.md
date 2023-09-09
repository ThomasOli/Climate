# Climate
**_Weather app that updates the weather in real time with reactive images and facts._**

![image](https://github.com/ThomasOli/Climate/assets/51518411/90d94996-fa9a-46d3-af3c-51c7015cc26d)
![image](https://github.com/ThomasOli/Climate/assets/51518411/961c60fe-d0f2-48d2-af4c-cb0d8b504bd6)

## App Description:

This app made use of asynchronous programming using the Dart language.

Seamless Asynchronous Execution: Implemented async and await, redefining the app's responsiveness and efficiency.

Futures: The Path to Parallelism: Included multitasking, allowing the app to perform complex tasks without sacrificing user experience.

Networking Prowess with Dart HTTP: The power of Dart's HTTP package connected with APIs effortlessly, transforming the app with dynamic, real-time data from the internet.

API Integration Mastery: Seamlessly integrated APIs into the application. Made use of real-world data to craft engaging and interactive experiences.

JSON Parsing Simplified: JSON parsing using Dart's convert package, makes complex data manipulation a breeze.

Sleek Navigation: Screen-to-screen transitions using the Navigator, managing data flow, and ensuring a seamless and intuitive user experience.

Robust Exception Handling: With try, catch, and throw, to handle exceptions, ensuring your apps remain stable and reliable.

Stateful Widgets in Harmony: Managed Stateful Widgets' lifecycles. App responded dynamically to user interactions, providing a polished and fluid interface.

Real-Time Location Integration: The Geolocator package captures live location data for both iOS and Android. The app became location-aware, opening the door to innovative possibilities.

User Input Revolution: Transformed user interactions with the TextField Widget, gathered input, and created interactive forms that enhanced engagement.


![image](https://github.com/ThomasOli/Climate/assets/51518411/a7f9dc41-7068-499f-87ad-9dc1ca047dab)

## Techniques Used

_Receiving and Generating User Location_

### Geolocator API

The Geolocator plugin version 3.0.1 allowed me to integrate the fetching of current location
weather data without the user’s need to specify their location. I chose this API for its cross-platform functionality and flexibility in specifying the accuracy of the current location function.
The following code was written with device-specific requirements in mind to enable this plugin’s
functionality
![image](https://github.com/ThomasOli/Climate/assets/51518411/176c7ae0-f483-4b73-aad6-bb150d77f749)

### Asynchronous Programming

Calling on the Geolocator plugin required a reference to the device’s internal framework and
connection to GPS, creating a time delay. To speed up loading times that prevented other tasks
from being carried out, I utilized asynchronous operations which complete work in the background to
allow the application to execute the next commands at the same time, regardless of the
function’s completion. After specifying getCurrentLocation() to be asynchronous, the app can
continue to build UI elements after the function is called on and loading, drastically reducing run
time.

![image](https://github.com/ThomasOli/Climate/assets/51518411/d7ca1dae-1fa1-4767-82b5-ce14b3c21901)

Using the Future class, the function returns a Future or a “placeholder” value that will be completed
when the result is available, which allows the program to function instead of blocking all
computation. The .getCurrentPosition() function fetches data while the position variable “awaits”
its response.

![image](https://github.com/ThomasOli/Climate/assets/51518411/7c2ad06c-e726-482e-a1a9-3b51edd3020b)

### Stateless & Stateful Widgets

As the basic building block of the UI, both stateful and stateless widgets were each used to
generate the screens of the application. Stateless widgets are immutable when built, which is
used for the search bar, city screen icons, and home screen icons: objects that don’t need to be
updated. With stateful widgets, the application can update the screen data, such as weather
information when the location has changed or if data needed time to be fetched. Using
initState(), a lifecycle method of stateful widgets, I set a call to getLocationData() to be
generated as soon as objects are pushed into the widget tree. Now, when the application is
opened, getLocationdata()(high in the hierarchy of tasks) is triggered to display the current
location’s weather data without the user needing to press a button. This featured allowed me to
guarantee my client a more convenient experience according to criteria, providing weather info
on the home screen.

![image](https://github.com/ThomasOli/Climate/assets/51518411/69225ca2-3b29-4b02-b9fc-f350aaca54cf)

The flutter framework is designed with inheritance by the Stateful or Stateless widget. On every
page within my application, every widget added to the widget tree after, are child classes that can
call on the build methods or state specific methods of these two parent classes. This inheritance
allows a page to run smoothly and not require a declaration of state type for every widget.
The following is a depiction of the state management between the two screens within the
application; each made up of both types of widgets:

![image](https://github.com/ThomasOli/Climate/assets/51518411/93cf5f0b-df98-4921-96cc-eef56dd69031)

To build the GUI, every widget is used to display a piece of
information on the screen.
Scaffolds are used to provide a basic framework and allow
widgets to be “scaffolded” onto it. The Container widget sets
a limit on the widget size to prevent overflow. Widget can then
be arranged into Columns or Rows that are ordered vertically
or horizontally. The Align widget positions the child widget
accordingly to a coordinate system. Padding is used as a
spacer between several widgets. Texts display string
information and icons display icon images. The TextField is a
mutable textbox and a TextButton is a clickable object. Every
widget is considered their own class with respective methods
and constructors. I chose to use a variety of both parent
widgets and child widgets for easy expandability and
extensibility. Parent widgets have divided the application into
manageable sections for new widgets to be smoothly added in.
Should a widget be added, the entire screen does not need
to be altered, instead, only a secondary parent widget. 
Exceptions
To prevent the application from crashing when the location is off or not connected to GPS, try-catch
statements were utilized. With much of the app relying on external sources, it’s more error-prone,
making it necessary to account for these errors: 

## Fetching & Processing Weather Data

**OpenWeatherMap API3**

This API was used due to its vast repository of information on cities around the world. The API
allowed any platform to request weather data with just a registered APIKEY, making weather data
widely available for my application.


**HTTP Library**

I used the HTTP plugin to access external website data, particularly the OpenWeatherMap API.
Integrating HTTP with asynchronous functions, I set error handling functions to catch situations
where no data is fetched or when the process is invalid. In this case, error code 200. 

**JSON Parsing**

The HTTP plugin fetchs the OpenWeatherMap weather information in JSON format, which is
made up of key-value pairs in a hierarchal tree format. JsonDecode is then passed to generate a
map based on the parsed JSON string for easy access to specific values the program needs. The JSON value is accessed through 2 levels and identified with the key, the brackets specify the
exact piece of data that the program requires, which is the city name, condition, and temperature
(converted into an INT for simplicity).

![image](https://github.com/ThomasOli/Climate/assets/51518411/c8bd37c7-bbc2-4876-a0de-2ae40be84a40)

Because OpenWeatherMap provides more than enough
information, a class with encapsulated values that are needed is used to store data separately
from the JSON map. Inheritance is achieved within this class, as WeatherModel’s
WeatherModel() function is extended within this class, calling on another class’s function.

![image](https://github.com/ThomasOli/Climate/assets/51518411/15d2885e-f52c-44c3-af98-1e9806b994fc)

By initializing a new WeatherModel() object; _LocationScreenState now allows the use of
functions like .getWeatherIcon() from the WeatherModel class, inheriting the other class’s
properties:

![image](https://github.com/ThomasOli/Climate/assets/51518411/aa188f83-4fee-4ec8-a62b-ca4652de5f3e)

![image](https://github.com/ThomasOli/Climate/assets/51518411/e9e676ce-f124-4972-b710-69507b74f323)

## _Generating Quips and Background Images_

**Stack**

Navigator is a routing widget that manages the routing and display of pages, managing them in a
stack. 
![image](https://github.com/ThomasOli/Climate/assets/51518411/38591ac0-daa2-43a5-a703-64bfd78f6103)

This featured integrated well with the Spinkit package, providing for lower load times and a
smoother user interface. The spinkit loading screen was pushed onto the navigator and popped
after, allowing multiple pages to be rendered at one instance(visually aesthetic transitions) and
routed to every screen in the application(backward navigation). The spin kit package
enabled an animation to be played while the current location data and
OpenWeatherMap information was being fetched:

![image](https://github.com/ThomasOli/Climate/assets/51518411/ad2f45c1-51b5-4e15-ab6c-d46b138dfa85)



**Design:**

![image](https://github.com/ThomasOli/Climate/assets/51518411/9f9d06d0-91a6-4f3d-b22a-0dc80527cba3)
![image](https://github.com/ThomasOli/Climate/assets/51518411/a9526d96-dead-4875-b6be-9296012644e2)
![image](https://github.com/ThomasOli/Climate/assets/51518411/47ecf536-0400-4dc9-ba1a-bbb433f6555b)


**Functions:**

![image](https://github.com/ThomasOli/Climate/assets/51518411/4cd29d7b-5fbc-426d-94ce-9e785dc9ed06)
![image](https://github.com/ThomasOli/Climate/assets/51518411/fcba8c0b-7d20-44da-9c26-3f8505f9dafb)
![image](https://github.com/ThomasOli/Climate/assets/51518411/e033f17b-6059-45fc-865a-9b4ce7945426)
![image](https://github.com/ThomasOli/Climate/assets/51518411/b4f5935a-1bb3-4026-a398-f75594157aea)

**Parsing JSON:**

![image](https://github.com/ThomasOli/Climate/assets/51518411/a068518b-f3b7-487f-b87e-f46fa43d3936)

![image](https://github.com/ThomasOli/Climate/assets/51518411/e5a79e2d-840c-4e9b-8ca5-b5c070c87d7e)

**Screen Design:**

![image](https://github.com/ThomasOli/Climate/assets/51518411/988e4953-a4c1-4926-a2c8-334339e543ed)
![image](https://github.com/ThomasOli/Climate/assets/51518411/a2983504-005c-4656-a84e-14ace06560db)
![image](https://github.com/ThomasOli/Climate/assets/51518411/c5ffa4f2-7bac-4106-8756-fe24d950faff)


