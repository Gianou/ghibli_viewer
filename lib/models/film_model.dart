class Film {
  final String id;
  final String title;
  final String originalTitle;
  final String originalTitleRomanised;
  final String image;
  final String movieBanner;
  final String description;
  final String director;
  final String producer;
  final String releaseDate;
  final String runningTime;
  final String rtScore;
  final List<String> people;
  final List<String> species;
  final List<String> locations;
  final List<String> vehicles;
  final String url;

  const Film({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.originalTitleRomanised,
    required this.image,
    required this.movieBanner,
    required this.description,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.runningTime,
    required this.rtScore,
    required this.people,
    required this.species,
    required this.locations,
    required this.vehicles,
    required this.url,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      id: json['id'] as String,
      title: json['title'] as String,
      originalTitle: json['original_title'] as String,
      originalTitleRomanised: json['original_title_romanised'] as String,
      image: json['image'] as String,
      movieBanner: json['movie_banner'] as String,
      description: json['description'] as String,
      director: json['director'] as String,
      producer: json['producer'] as String,
      releaseDate: json['release_date'] as String,
      runningTime: json['running_time'] as String,
      rtScore: json['rt_score'] as String,
      people:
          (json['people'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      species:
          (json['species'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      locations:
          (json['locations'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      vehicles:
          (json['vehicles'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      url: json['url'] as String,
    );
  }
}
