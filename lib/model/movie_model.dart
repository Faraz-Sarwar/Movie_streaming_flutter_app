class MovieModel {
  List<Data>? data;

  MovieModel({this.data});

  MovieModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? title;
  String? year;
  String? rated;
  String? released;
  String? runtime;
  String? genre;
  String? director;
  String? writer;
  String? actors;
  String? plot;
  String? language;
  String? country;
  String? awards;
  String? poster;
  String? imdbRating;
  String? imdbId;
  String? boxOffice;

  Data({
    this.id,
    this.title,
    this.year,
    this.rated,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.writer,
    this.actors,
    this.plot,
    this.language,
    this.country,
    this.awards,
    this.poster,
    this.imdbRating,
    this.imdbId,
    this.boxOffice,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    year = json['year'];
    rated = json['rated'];
    released = json['released'];
    runtime = json['runtime'];
    genre = json['genre'];
    director = json['director'];
    writer = json['writer'];
    actors = json['actors'];
    plot = json['plot'];
    language = json['language'];
    country = json['country'];
    awards = json['awards'];
    poster = json['poster'];
    imdbRating = json['imdbRating'];
    imdbId = json['imdbId'];
    boxOffice = json['boxOffice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['year'] = year;
    data['rated'] = rated;
    data['released'] = released;
    data['runtime'] = runtime;
    data['genre'] = genre;
    data['director'] = director;
    data['writer'] = writer;
    data['actors'] = actors;
    data['plot'] = plot;
    data['language'] = language;
    data['country'] = country;
    data['awards'] = awards;
    data['poster'] = poster;
    data['imdbRating'] = imdbRating;
    data['imdbId'] = imdbId;
    data['boxOffice'] = boxOffice;
    return data;
  }
}
