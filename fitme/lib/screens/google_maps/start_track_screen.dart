import 'package:fitme/models/track.dart';
import 'package:fitme/providers/track_provider.dart';
import 'package:fitme/screens/google_maps/google_map_screen.dart';
import 'package:fitme/screens/google_maps/see_track.dart';
import 'package:fitme/widgets/filled_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartTrackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: Center(
          child: Text(
            'TRACK RECORDING',
            style: TextStyle(
              fontSize: 35,
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FilledButton(
          title: 'Start',
          color: Colors.lightBlue,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return GoogleMapScreen();
                },
              ),
            );
          },
        ),
      ),
      body: Consumer<TrackProvider>(
        builder: (_, model, child) {
          List<Track> tracks = model.getTracks;
          return ListView.builder(
            itemCount: tracks.length,
            itemBuilder: (_, int index) {
              print(tracks.isEmpty);
              if (tracks.isEmpty) {
                return Center(
                  child: Text(
                      'Looks like there aren\'t any tracks.\nLet\'s create some'),
                );
              }
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return SeeTrack(
                          tracks[index],
                        );
                      },
                    ),
                  );
                },
                child: ListTile(
                  title: Text(
                    (index + 1).toString() +
                        '. ' +
                        tracks[index].date.toString().substring(0, 19),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
