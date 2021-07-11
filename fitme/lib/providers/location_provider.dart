import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationProvider with ChangeNotifier {
  Location _location;
  LatLng _locationPosition;
  List<LatLng> _points;
  Map<PolylineId, Polyline> _mapPolylines;
  int _polylineIdCounter = 1;
  bool locationServiceActive = true;

  Location get location {
    return _location;
  }

  LatLng get locationPosition {
    return _locationPosition;
  }

  List<LatLng> get getPoints {
    return _points;
  }

  Map<PolylineId, Polyline> get getMapPolylines {
    return _mapPolylines;
  }

  LocationProvider() {
    _location = Location();
    _points = <LatLng>[];
    _mapPolylines = {};
  }

  initalization() async {
    await getUserLocation();
  }

  getUserLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();

      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();

      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    location.onLocationChanged.listen(
      (LocationData currentLocation) {
        _locationPosition = LatLng(
          currentLocation.latitude,
          currentLocation.longitude,
        );

        final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
        _polylineIdCounter++;
        final PolylineId polylineId = PolylineId(polylineIdVal);

        final Polyline polyline = Polyline(
          polylineId: polylineId,
          width: 5,
          points: _createPoints(latLng: _locationPosition),
        );

        _mapPolylines[polylineId] = polyline;

        _points.add(_locationPosition);

        notifyListeners();
      },
    );
  }

  List<LatLng> _createPoints({@required LatLng latLng}) {
    _points.add(latLng);
    return _points;
  }
}
