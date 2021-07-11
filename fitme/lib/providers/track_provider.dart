import 'package:fitme/models/track.dart';
import 'package:flutter/foundation.dart';

class TrackProvider with ChangeNotifier {
  List<Track> _tracks = [];

  void addTrack(Track track) {
    _tracks.add(track);

    notifyListeners();
  }

  List<Track> get getTracks {
    return _tracks;
  }
}
