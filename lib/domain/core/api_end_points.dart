import 'package:netflix_clone/core/colors/strings.dart';
import 'package:netflix_clone/infrastructure/api_keys.dart';

class ApiEndPoints {
  static const dowloads = "$kBaseurl/trending/all/day?api_key=$appKey";
  static const Search = '$kBaseurl/search/movie?api_key=$appKey';
}
