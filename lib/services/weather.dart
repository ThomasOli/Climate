import 'package:Weatherly/services/location.dart';
import 'package:Weatherly/services/networking.dart';
import 'dart:math';

const apiKey = 'b3e42df5e38b3b5d92dc7c32c8ca975c'; //API Key
const openWeatherMapURL =
    'https://api.openweathermap.org/data/2.5/weather'; //API location
int count1;
var rng = Random();

List<List<String>> quips = [
  ["unknown"],
  [
    "I’m going to discuss global warming on Sunday at a debate. It’s a very heated topic.",
    "It’s so hot that when I saw a heatwave, I waved back.",
    "It was hot today and when I went outside I saw there was a line of guys standing outside the hairdressers. I thought to myself, “Such a lovely day to have a barber queue”.",
    "I spent 60 seconds in this 90-degree weather. It’s been a hot minute.",
    "I went to Chicago and the weather forecast said it would be muggy. The forecaster was right because when I went outside, someone stole my shoes.",
    "The brightest days of the months are the sun-days.",
    "I received a message from the sun. After reading it, I was enlightened.",
    "Expecting a summer and hot weather pun to brighten up your day just like a bright shining sun?",
    "Perfect day for a 🏊",
    "Time for shorts and 👕"
  ],
  [
    "Bring a 🧥 just in case",
    "Meteorologists use a 'Thor-mometer' to track lightning strikes.",
    "A lightning strike survivor was interviewed. He said, It was so shockingly powerful and it really Hertz.",
    "Lightning storms are always so very striking.",
    "Two lightning bolts decided on a perfect place for their date. They went to Cloud 9.",
    "There was a bolt of lightning who loved to play a lot of different sports. His friends called him 'ball lightning'.",
    " Lightning is the worst worker because it’s always on strike.",
    "The man who was driving the train got struck by lightning. It's because he was a good conductor.",
    "One day, Thor lost his lightning powers. Because his father had grounded him.",
    "There was a thunderstorm who wasn’t getting paid enough. So he decided to go on a lightning strike.",
    "Lightning just doesn’t know how to conduct itself. So sometimes it can shock people.",
    "Currently, I have been reading a bunch of news articles dealing with lightning strikes to keep myself updated about current events.",
    "I hate windy weather. It really blows.",
    "The cloud became dark and stormy. Because he had been feeling very mis-thunder-stood.",
    "The lightning is quite striking!"
  ],
  [
    "The little cloud idolized his big brother because he was the raining champion.",
    "The cloud king rained for years.",
    "God spilt water again",
    "It might feel like pee",
    "The cows lay down in the rain to keep each udder dry.",
    "One raindrop said to its other raindrop friend, Two's company, three's a cloud.",
    " It rains money when there’s a change in the weather.",
    "A pilot friend of mine took the flight exam and flew past a rainbow. No wonder, he passed with flying colors.",
    "A queen's favorite weather is the 'rain'.",
    "The difference between the weather and a horse is while one rains down, the other gets reined up.",
    "A storm that doesn’t come to fruition is called a mist opportunity.",
    "My dad prefers driving in the rain. He says, things just run more fluidly.",
    "When a series of misfortunes happen, it never rains but it pours.",
    "The last words of an evaporating raindrop were, I'm going to pieces.",
    "It always sprinkles before it rains candy."
  ],
  [
    "Our weather bureau is actually an umbrella organization.",
    "People using umbrellas seem to be always under the weather.",
    " It was raining so hard that the drizzly bear had to hide.",
    "Local weather reported today that there won't be any rain for a year. But I drought it.",
    "It was raining cats and dogs, and so there were poodles all over the streets.",
    "It was raining chickens and ducks. I guess it was fowl weather.",
    "We got the news of a coming flood today. The news was leaked.",
    "There's a basic difference between weather and climate: you can’t weather a tree, but you can definitely climate.",
    "The spy went undercover to get out of the rain.",
    "A dangerous precipitation is called 'a rain of terror'.",
    " If it's really raining cats and dogs, you should hail a taxi as soon as possible.",
    "When the hailstone described its life, it said it has had a lot of ups and downs.",
    "Bees cannot fly in the rain without their yellow jackets.",
    "It was raining all week and it started to make me feel like I should build an ark. Hearing this, my friend said, I Noah guy who can help.",
    "The hail storm said to the roof, Hang onto your shingles, this is not going to be any ordinary sprinkles."
  ],
  [
    "These winter puns are for everyone to spend their time enjoying under a warm blanket.",
    "I’m trying to break the ice, but you just keep giving me the cold shoulder.",
    "The opposite of a cold front is a warm back.",
    "You\'ll need 🧣 and 🧤",
    "There was news of a snowstorm. It arrived white on time.",
    "Cold and chilly winter weather is snow laughing matter.",
    "The winter is the worst time of year for a wedding. The grooms always seem to be getting cold feet.",
    "The weather forecast said there'd be freezing rain. Sure enough, it was an ice day.",
    "Whenever someone wishes me to say Happy Winter, it always leaves me cold.",
    "A dollar bill frozen in the ice is called cold, hard cash.",
    "A bunch of chill-dren from the neighborhood played all afternoon in the snow.",
    "I wanted to be a professional fortune-teller but I wasn't very good at it. I could only predict when there would be bad winter storms. Well, turns out I had been using a snow globe.",
    "Mother always knows best. But when winter comes around, Mother Nature snows best.”,“For those people who live in northern climates, the winter is snow problem.",
    "A mountain's favorite type of candy is a 'Sno Caps'.",
    "The snowman and his wife were very confused when they saw their baby walking. They called the baby - Snowmobile.",
    "A snowman that keeps telling tall tales is called a snow-fake.",
    " A snowman's favorite thing to eat for lunch is, 'Icebergers'",
    "The best way to prevent a summer cold is to catch it in the winter.",
    "The safest place for snowmen to keep their money is in a snow bank.",
    "It was really cold this morning. When I took out my phone, the weather app froze.",
    "I definitely prefer cold weather, but only to a certain degree.",
    "A terrible cold spell at the end of the year is called 'Decemburr.'",
    "I’m feeling exceptionally alone in this cold weather. It's probably because I’m completely ice-olated.",
    "A woman got hit on the head during a hail storm. She was knocked out cold."
  ],
  [
    "Many people seem to believe that warm water droplets get cooled fast and form fog. It's a mist-conception. Someone should de-mist-ify it.",
    "If your mind was in a fog or clouded, you might have mist some opportunities.",
    " I saw one cloud of fog talking to another. I couldn't hear what they were talking about. It’s a mistery.",
    "A fog is the kind of cloud who is so lazy that it will never get up.",
    "I think I saw some fog yesterday. But I'm not sure. My memory seems to be a little cloudy."
  ],
  [
    "The cloud was feeling under the weather. So, it decided to stay at home.",
    "A cloud always wears thunderwear under his raincoat.",
    "It never rains when the internet is down because all of it is based in the cloud.",
    "The clouds can be quite rude. They are always throwing shade.",
    "The cloud met with the tree who was his long lost friend. He said, I mist you.",
    "Gravity is such a great thing. It always keeps my head out of the clouds.",
    "The best place to store water is the cloud storage.",
    "The biggest problem with atmospheric scientists is that they always have their heads in the clouds.",
    "As soon as the light show ended, the clouds gave it a thunderous applause.",
    "I saw a cloud today that was shaped like a mermaid. I called it 'Aerial'."
  ]
];

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(//
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      count1 = 2;
      //weather = "thunderstorm";
      return '🌩';
    } else if (condition < 400) {
      count1 = 3;
      //weather = "drizzle";
      return '🌧';
    } else if (condition < 600) {
      count1 = 4;
      //weather = "heavy rain";
      return '☔️';
    } else if (condition < 700) {
      count1 = 5;
      //weather = "snow";
      return '☃️';
    } else if (condition < 800) {
      count1 = 6;
      //weather = "fog";
      return '🌫';
    } else if (condition == 800) {
      count1 = 1;
      //weather = "sun";
      return '☀️';
    } else if (condition <= 804) {
      count1 = 7;
      //weather = "cloudy";
      return '☁️';
    } else {
      count1 = 0;
      //weather = "unknown";
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    //Returns random pun specific to temperature
    if (count1 == 1) {
      return quips[count1][rng.nextInt(quips[count1].length)];
    } else if (count1 == 2) {
      return quips[count1][rng.nextInt(quips[count1].length)];
    } else if (count1 == 3) {
      return quips[count1][rng.nextInt(quips[count1].length)];
    } else if (count1 == 4) {
      return quips[count1][rng.nextInt(quips[count1].length)];
    } else if (count1 == 5) {
      return quips[count1][rng.nextInt(quips[count1].length)];
    } else if (count1 == 6) {
      return quips[count1][rng.nextInt(quips[count1].length)];
    } else if (count1 == 7) {
      return quips[count1][rng.nextInt(quips[count1].length)];
    } else {
      return null;
    }
  }
}
