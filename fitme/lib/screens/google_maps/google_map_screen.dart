import 'package:fitme/models/track.dart';
import 'package:fitme/providers/location_provider.dart';
import 'package:fitme/providers/track_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  Map<PolylineId, Polyline> mapPolylines = {};

  @override
  void initState() {
    super.initState();
    Provider.of<LocationProvider>(context, listen: false).initalization();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: googleMapUI(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.stop),
        onPressed: () {
          Track track = Track();
          track.date = DateTime.now();
          track.polylines =
              Provider.of<LocationProvider>(context, listen: false)
                  .getMapPolylines;
          Provider.of<TrackProvider>(context, listen: false).addTrack(track);
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget googleMapUI() {
    return Consumer<LocationProvider>(
      builder: (_, model, child) {
        if (model.locationPosition != null) {
          return Column(
            children: [
              Expanded(
                child: GoogleMap(
                  polylines: Set<Polyline>.of(model.getMapPolylines.values),
                  // onMapCreated: (GoogleMapController googleMapController) {},
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: model.locationPosition,
                    zoom: 180,
                  ),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                ),
              ),
            ],
          );
        }
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
