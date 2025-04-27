import '../data/models/athlete.dart';
import '../data/models/athletics.dart';
import '../data/models/cuisine.dart';
import '../data/models/restaurant.dart';
import '../data/models/actor.dart';
import '../data/models/cinema.dart';
import '../data/models/country.dart';
import '../data/models/director.dart';
import '../data/models/driving_side.dart';
import '../data/models/emergency.dart';
import '../data/models/dish.dart';
import '../data/models/genre.dart';
import '../data/models/history.dart';
import '../data/models/meal_type.dart';
import '../data/models/metro.dart';
import '../data/models/movie.dart';
import '../data/models/music.dart';
import '../data/models/religion.dart';
import '../data/models/singer.dart';
import '../data/models/song.dart';
import '../data/models/sport.dart';
import '../data/models/transport.dart';
import '../data/models/trophy.dart';
import '../data/models/tv_show.dart';

class CountryViewModel {
  // Function to get a country (example: Algeria)
  Country getCountry() {
    return Country(
      id: 'DZ',
      name: 'Algeria',
      imageUrl: 'assets/algeria.jpg',
      description: 'Algeria is a country in North Africa...',
      capital: 'Algiers',
      majorCities: ['Algiers', 'Oran', 'Constantine'],
      languages: ['Arabic', "Amazigh"],
      currency: 'DZD',
      religion: Religion.islam,
      dialCode: '+213',
      cuisine: Cuisine(
        dishes: [
          Dish(
            name: "Couscous",
            description: "A staple dish made of steamed semolina served with vegetables and meat.",
            mealType: MealType.dinner,
            imageUrl: 'lib/core/assets/Couscous.png',
          ),
          Dish(
            name: "Chakchouka",
            description: "A spicy tomato and pepper stew with poached eggs.",
            mealType: MealType.breakfast,
            imageUrl: 'lib/core/assets/Couscous.png',
          ),
          Dish(
            name: "Makroud",
            description: "A sweet pastry filled with dates and nuts, often served with tea.",
            mealType: MealType.dessert,
            imageUrl: 'lib/core/assets/Couscous.png',
          ),
        ],
        restaurants: [
          Restaurant(
            name: "Le Tajine",
            city: "Algiers",
            latitude: 36.7538,
            longitude: 3.0588,
          ),
          Restaurant(
            name: "Dar El Djazair",
            city: "Oran",
            latitude: 35.6977,
            longitude: -0.6331,
          ),
          Restaurant(
            name: "El Bahdja",
            city: "Constantine",
            latitude: 36.365,
            longitude: 6.6147,
          ),
        ],
      ),
      music: Music(
        genres: [
          Genre(name: 'Raï', imageUrl: 'raï_image.jpg'),
          Genre(name: 'Chaabi', imageUrl: 'chaabi_image.jpg'),
        ],
        topSongs: [
          Song(name: 'Didi', views: 1000),
          Song(name: 'Abdel Kader', views: 2000),
        ],
        notableSingers: [
          Singer(name: 'Cheb Khaled', age: 60, songs: []),
          Singer(name: 'Warda', age: 65, songs: []),
        ],
      ),
      cinema: Cinema(
        topMovies: [
          Movie(name: 'The Battle of Algiers', image: 'battle.jpg'),
          Movie(name: 'Outside the Law', image: 'outside.jpg'),
        ],
        topTvShows: [
          TvShow(name: 'Algerian Comedy', image: 'comedy.jpg'),
          TvShow(name: 'Algerian Talk Show', image: 'talkshow.jpg'),
        ],
        famousActors: [
          Actor(name: 'Sami Bouajila', age: 50),
          Actor(name: 'Leila Bekhti', age: 38),
        ],
        directors: [
          Director(name: 'Rachid Bouchareb', age: 60),
          Director(name: 'Merzak Allouache', age: 72),
        ],
      ),
      history: History(
        nationalDay: DateTime(1962, 7, 5),
        publicHolidays: {
          "New Year's Day": DateTime(2025, 1, 1),
          "Labor Day": DateTime(2025, 5, 1),
        },
        keyEvents: {
          "Start of the Algerian War": DateTime(1954, 11, 1),
          "Independence Day": DateTime(1962, 3, 19),
        },
      ),
      athletics: Athletics(
        popularSports: [
          Sport(
            name: "Football",
            nationalTeamYear: 1962,
            trophies: [
              Trophy(name: "AFCON", count: 2),
              Trophy(name: "FIFA Arab Cup", count: 1),
            ],
            teamLogo: "assets/algeria_football.png",
          ),
          Sport(
            name: "Handball",
            nationalTeamYear: 1964,
            trophies: [
              Trophy(name: "African Championship", count: 7),
            ],
            teamLogo: "assets/algeria_handball.png",
          ),
        ],
        athletes: [
          Athlete(
            name: "Riyad Mahrez",
            age: 33,
            sportName: "Football",
          ),
          Athlete(
            name: "Hassiba Boulmerka",
            age: 56,
            sportName: "Athletics",
          ),
        ],
      ),
      transport: Transport(
        airports: [
          'Houari Boumediene International Airport',
          'Oran Ahmed Ben Bella Airport',
        ],
        drivingSide: DrivingSide.right,
        taxiApps: ['Uber', 'Yassir'],
        metroSystems: [
          Metro(city: 'Algiers', image: 'algiers_metro.jpg'),
          Metro(city: 'Oran', image: 'oran_metro.jpg'),
        ],
      ),
      emergency: Emergency(police: 17, ambulance: 14, fire: 19),
    );
  }
}
