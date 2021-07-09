//@dart=2.9
import 'dart:async';
import 'package:fitme/classes/Tracks.dart';
import 'package:fitme/classes/User.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MainDatabase {
  static final MainDatabase instance = MainDatabase._init();

  static Database _database;

  MainDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDB('MainDatabase.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableTracks
      (
        ${TrackFields.id} INTEGER,
        ${TrackFields.info} TEXT
      )
      ''');

    await db.execute('''
      CREATE TABLE $tableUser
      (
        ${UserFields.id} INTEGER,
        ${UserFields.name} TEXT,
        ${UserFields.email} TEXT,
        ${UserFields.height} INTEGER,
        ${UserFields.weight} INTEGER,
        ${UserFields.meditation} BOOLEAN,
        ${UserFields.physical} INTEGER,
        ${UserFields.targetWeight} INTEGER,
        ${UserFields.score} INTEGER,
        ${UserFields.totalScore} INTEGER,
        ${UserFields.achievementsList} TEXT
      )
      ''');

    await db.execute('''
      ''');
  }

  Future<Track> addTrack(Track track) async {
    final db = await instance.database;
    final id = await db.insert(tableTracks, track.toJson());
    return track.copy(id: id);
  }

  Future<Track> getSubject(int trackID) async {
    final db = await instance.database;
    final maps = await db.query(
      tableTracks,
      columns: TrackFields.values,
      where: '${TrackFields.id} = ?',
      whereArgs: [trackID],
    );

    if (maps.isNotEmpty) {
      return Track.fromJson(maps.first);
    } else {
      throw Exception('$trackID not found');
    }
  }

  Future<List<Track>> getAllTracks() async {
    final db = await instance.database;

    final result = await db.query(tableTracks);

    return result.map((json) => Track.fromJson(json)).toList();
  }

  Future<int> updateTrack(Track track) async {
    final db = await instance.database;

    return db.update(tableTracks, track.toJson(),
        where: '${TrackFields.info} = ?', whereArgs: [track.info]);
  }

  Future<int> deleteTrack(int trackID) async {
    final db = await instance.database;

    return await db.delete(tableTracks,
        where: '${TrackFields.id} = ?', whereArgs: [trackID]);
  }

  Future<void> deleteTable() async {
    final db = await instance.database;
    return await db.execute('DELETE FROM $tableTracks');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
