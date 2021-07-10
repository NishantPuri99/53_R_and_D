//@dart=2.9
import 'dart:async';
import 'package:fitme/classes/Macros.dart';
import 'package:fitme/classes/Meditation.dart';
import 'package:fitme/classes/Running.dart';
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

    _database = await _initDB('MainDatabase1.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  //Function to intialise all the tables and their respective CRUD operation functions
  Future _createDB(Database db, int version) async {
    //Tracks table
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
      CREATE TABLE $tableMeditation
      (
        ${MeditationFields.id} INTEGER,
        ${MeditationFields.time} TEXT,
        ${MeditationFields.activityID} INTEGER,
        ${MeditationFields.target} INTEGER
        
      )
      ''');

    await db.execute('''
    CREATE TABLE $tableRunning
    (
      ${RunningFields.id} INTEGER,
      ${RunningFields.date} TEXT,
      ${RunningFields.distanceCovered} INTEGER,
      ${RunningFields.targetDistance} INTEGER,
      ${RunningFields.time} TEXT
    )
    ''');

    await db.execute('''
    CREATE TABLE $tableMacro
    (
      ${MacroFields.id} INTEGER,
      ${MacroFields.itemName} TEXT,
      ${MacroFields.calories} INTEGER,
      ${MacroFields.protein} INTEGER,
      ${MacroFields.carbohydrates} INTEGER,
      ${MacroFields.fats} INTEGER,
      ${MacroFields.day} INTEGER,
      ${MacroFields.month} INTEGER,
      ${MacroFields.year} INTEGER
    )
    ''');
  }

  Future<Track> addTrack(Track track) async {
    final db = await instance.database;
    final id = await db.insert(tableTracks, track.toJson());
    return track.copy(id: id);
  }

  Future<Track> getTrack(int trackID) async {
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

  Future<void> deleteTableTrack() async {
    final db = await instance.database;
    return await db.execute('DELETE FROM $tableTracks');
  }

  //User table

  Future<User> addUser(User user) async {
    final db = await instance.database;
    final id = await db.insert(tableUser, user.toJson());
    return user.copy(id: id);
  }

  Future<User> getUser(int userID) async {
    final db = await instance.database;
    final maps = await db.query(
      tableUser,
      columns: UserFields.values,
      where: '${UserFields.id} = ?',
      whereArgs: [userID],
    );

    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      throw Exception('$userID not found');
    }
  }

  Future<int> updateUser(User user) async {
    final db = await instance.database;

    return db.update(tableUser, user.toJson(),
        where: '${UserFields.id} = ?', whereArgs: [user.id]);
  }

  Future<int> deleteUser(int userID) async {
    final db = await instance.database;

    return await db
        .delete(tableUser, where: '${UserFields.id} = ?', whereArgs: [userID]);
  }

  Future<void> deleteTableUser() async {
    final db = await instance.database;
    return await db.execute('DELETE FROM $tableUser');
  }

  //Meditation table

  Future<Meditation> addMeditation(Meditation meditation) async {
    final db = await instance.database;
    final id = await db.insert(tableMeditation, meditation.toJson());
    return meditation.copy(id: id);
  }

  Future<Meditation> getMeditation(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableTracks,
      columns: MeditationFields.values,
      where: '${MeditationFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Meditation.fromJson(maps.first);
    } else {
      throw Exception('$id not found');
    }
  }

  Future<List<Meditation>> getAllMeditations() async {
    final db = await instance.database;

    final result = await db.query(tableMeditation);

    return result.map((json) => Meditation.fromJson(json)).toList();
  }

  Future<int> updateMeditation(Meditation meditation) async {
    final db = await instance.database;

    return db.update(tableMeditation, meditation.toJson(),
        where: '${MeditationFields.id} = ?', whereArgs: [meditation.id]);
  }

  Future<int> deleteMeditation(int id) async {
    final db = await instance.database;

    return await db.delete(tableMeditation,
        where: '${MeditationFields.id} = ?', whereArgs: [id]);
  }

  Future<void> deleteTableMeditation() async {
    final db = await instance.database;
    return await db.execute('DELETE FROM $tableMeditation');
  }

  //Running table

  Future<Running> addRunning(Running running) async {
    final db = await instance.database;
    final id = await db.insert(tableRunning, running.toJson());
    return running.copy(id: id);
  }

  Future<Running> getRunning(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableRunning,
      columns: RunningFields.values,
      where: '${RunningFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Running.fromJson(maps.first);
    } else {
      throw Exception('$id not found');
    }
  }

  Future<List<Running>> getAllRunning() async {
    final db = await instance.database;

    final result = await db.query(tableRunning);

    return result.map((json) => Running.fromJson(json)).toList();
  }

  Future<int> updateRunning(Running running) async {
    final db = await instance.database;

    return db.update(tableRunning, running.toJson(),
        where: '${RunningFields.id} = ?', whereArgs: [running.id]);
  }

  Future<int> deleteRunning(int id) async {
    final db = await instance.database;

    return await db.delete(tableRunning,
        where: '${RunningFields.id} = ?', whereArgs: [id]);
  }

  Future<void> deleteTableRunning() async {
    final db = await instance.database;
    return await db.execute('DELETE FROM $tableRunning');
  }

  //Macros

  Future<Macro> addMacro(Macro macro) async {
    final db = await instance.database;
    final id = await db.insert(tableMacro, macro.toJson());
    print('Macro added');
    return macro.copy(id: id);
  }

  Future<Macro> getMacro(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableMacro,
      columns: MacroFields.values,
      where: '${MacroFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Macro.fromJson(maps.first);
    } else {
      throw Exception('$id not found');
    }
  }

  Future<List<Macro>> getAllMacro() async {
    final db = await instance.database;

    final result = await db.query(tableMacro);

    return result.map((json) => Macro.fromJson(json)).toList();
  }

  Future<int> updateMacro(Macro macro) async {
    final db = await instance.database;

    return db.update(tableMacro, macro.toJson(),
        where: '${MacroFields.id} = ?', whereArgs: [macro.id]);
  }

  Future<int> deleteMacro(int id) async {
    final db = await instance.database;

    return await db
        .delete(tableMacro, where: '${MacroFields.id} = ?', whereArgs: [id]);
  }

  Future<void> deleteTableMacro() async {
    final db = await instance.database;
    return await db.execute('DELETE FROM $tableMacro');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
