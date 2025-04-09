import '../data/models/actor.dart';
import '../data/models/cinema.dart';
import '../data/models/country.dart';
import '../data/models/director.dart';
import '../data/models/driving_side.dart';
import '../data/models/emergency.dart';
import '../data/models/food.dart';
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
      language: 'Arabic',
      currency: 'DZD',
      religion: Religion.islam,
      dialCode: '+213',
      food: [
        Food(name: 'Couscous', description: 'Traditional dish', mealType: MealType.lunch),
        Food(name: 'Mechoui', description: 'Roasted lamb', mealType: MealType.dinner)
      ],
      music: Music(
        genres: [
          Genre(name: 'Raï', image: 'raï_image.jpg'),
          Genre(name: 'Chaabi', image: 'chaabi_image.jpg')
        ],
        topSongs: [
          Song(name: 'Didi', views: 1000),
          Song(name: 'Abdel Kader', views: 2000)
        ],
        notableSingers: [
          Singer(name: 'Cheb Khaled', age: 60, songs: []),
          Singer(name: 'Warda', age: 65, songs: [])
        ],
      ),
      cinema: Cinema(
        topMovies: [
          Movie(name: 'The Battle of Algiers', image: 'battle.jpg'),
          Movie(name: 'Outside the Law', image: 'outside.jpg')
        ],
        topTvShows: [
          TvShow(name: 'Algerian Comedy', image: 'comedy.jpg'),
          TvShow(name: 'Algerian Talk Show', image: 'talkshow.jpg')
        ],
        famousActors: [
          Actor(name: 'Sami Bouajila', age: 50),
          Actor(name: 'Leila Bekhti', age: 38)
        ],
        directors: [
          Director(name: 'Rachid Bouchareb', age: 60),
          Director(name: 'Merzak Allouache', age: 72)
        ],
      ),
      history: History(
        nationalDay: DateTime(1962, 7, 5),
        publicHolidays: [DateTime(2025, 1, 1), DateTime(2025, 5, 1)],
        keyEvents: [DateTime(1954, 11, 1), DateTime(1962, 3, 19)],
      ),
      sport: Sport(),
      transport: Transport(
        airports: ['Houari Boumediene International Airport', 'Oran Ahmed Ben Bella Airport'],
        drivingSide: DrivingSide.right,
        taxiApps: ['Uber', 'Yassir'],
        metroSystems: [
          Metro(city: 'Algiers', image: 'algiers_metro.jpg'),
          Metro(city: 'Oran', image: 'oran_metro.jpg')
        ],
      ),
      emergency: Emergency(
        police: '17',
        ambulance: '14',
        fire: '19',
      ),
    );
  }
}