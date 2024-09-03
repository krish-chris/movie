import 'dart:convert';
import 'package:http/http.dart' as http ;
import '../models/movies.dart';

class MovieApi{
  static Future<List<Movie>> fetchMovie() async {
    const url = 'https://dummyapi.online/api/movies';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final List<dynamic> json = jsonDecode(response.body);
    final List<Movie> fetchedMovies = json.map((e) => Movie.fromMap(e)).toList();
    return fetchedMovies ;
  }
}