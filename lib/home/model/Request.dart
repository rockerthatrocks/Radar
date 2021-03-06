import 'package:geodesy/geodesy.dart';
import 'package:location/location.dart';
import 'dart:math';

class Request {
  String id;
  String title;
  String description;
  double distance;

  Request({this.id, this.title, this.description, this.distance});

  factory Request.create(String id, String request, LocationData userLocation) {
    List<String> list = request.split('+');
    String title = list[0];
    String description = list[1];
    double requestLatitude = double.parse(list[2]);
    double requestLongitude = double.parse(list[3]);
    double userLatitude = userLocation.latitude;
    double userLongitude = userLocation.longitude;
    double distance = Geodesy().distanceBetweenTwoGeoPoints(
        LatLng(requestLatitude, requestLongitude),
        LatLng(userLatitude, userLongitude));
    return Request(
      id: id,
      title: title,
      description: description,
      distance: distance,
    );
  }
}
