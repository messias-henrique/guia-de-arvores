import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();
  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        "https://www.google.com/maps/place/Parque+Zoobot%C3%A2nico+Teresina/@-5.0418821,-42.7695177,18.54z/data=!4m13!1m7!3m6!1s0x78e3bef7bd981bd:0x922f2a36ca4c6c2f!2sZoobot%C3%A2nico,+Teresina+-+PI!3b1!8m2!3d-5.0456771!4d-42.778437!3m4!1s0x78e382d9fc9091d:0x6dc1bbb5ab176f8b!8m2!3d-5.0410936!4d-42.7685468";

    // "https://www.google.com/maps/search/@?api=1&query=$latitude%2C$longitude";
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw "Could not open the map.";
    }
  }
}
