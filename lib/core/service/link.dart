import '/core/const_data/const_data.dart';

class AppLink {
  static String approot = "https://task.focal-x.com";
  static String imageWithRoot = "$approot/storage/";
  static String imageWithoutRoot = approot;
  static String serverApiRoot = "$approot/api";
  static String home = "$serverApiRoot/home";
  static String categories = "$serverApiRoot/categories";

  Map<String, String> getHeaderwithoutToken() {
    Map<String, String> mainHeader = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-Request-with': 'XMLHttpRequest'
    };
    return mainHeader;
  }

  Map<String, String> getHeaderToken() {
    Map<String, String> mainHeader = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer 1037|nCYLOmOF6cnQl7KS2AFs2eXtVEnTURqXpqeIntUice49c0c1'
    };
    return mainHeader;
  }
}
