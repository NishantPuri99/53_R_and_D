import 'package:fitme/models/track.dart';
import 'package:fitme/providers/location_provider.dart';
import 'package:fitme/providers/track_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class SeeTrack extends StatelessWidget {
  final Track track;

  SeeTrack(this.track);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.lightBlue,
        height: 50,
        child: Center(
          child: Text(
            'Distance Travelled: 0 km',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              polylines: Set<Polyline>.of(track.polylines.values),
              // onMapCreated: (GoogleMapController googleMapController) {},
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: track.polylines.values.first.points.first,
                zoom: 180,
              ),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
            ),
          ),
        ],
      ),
    );
  }
}
