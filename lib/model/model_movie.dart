//For managing movie's data easliy.
class Movie{
  final String title;
  final String keyword;
  final String poster;
  final bool like;

  Movie.fromMap(Map<String, dynamic> map)
  : title = map['title'],
    keyword = map['keyworkd'],
    poster = map['poster'],
    like = map['like'];

    @override
    String toString() => "Movie<$title:$keyword>";
}