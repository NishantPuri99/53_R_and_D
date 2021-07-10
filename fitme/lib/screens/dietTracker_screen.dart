import 'dart:convert';
import 'dart:ui';
import 'package:fitme/classes/Macros.dart';
import 'package:fitme/databases/MainDatabase.dart';
import 'package:fitme/models/macroModel.dart';
import 'package:flutter/material.dart';
import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';

class DietTrackerScreen extends StatefulWidget {
  DietTrackerScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DietTrackerScreenState createState() => _DietTrackerScreenState();
}

List<String> macros = ['0', '0', '0', '0'];
List<String> attributes = ['Calories', 'Proteins', 'Carbs', 'Fats'];
String searchFor;
int searchForLength;
List<Macro> dbMacros;
List<ChartData> chartData = [
  ChartData('Proteins', 11),
  ChartData('Carbohydrates', 21),
  ChartData('Fats', 32),
];

class _DietTrackerScreenState extends State<DietTrackerScreen> {
  @override
  void initState() {
    super.initState();
    getMacroData();
  }

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.ac_unit,
      Icons.account_balance,
      Icons.adb,
      Icons.add_photo_alternate,
      Icons.format_line_spacing
    ];

    return Scaffold(
        body: DraggableBottomSheet(
      backgroundWidget: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              padding: EdgeInsets.only(top: 25, bottom: 20),
              height: 105,
              width: 350,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Enter food, eg :Pasta, mango, milk',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(color: Colors.grey, width: 0.75),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.5),
                    borderSide:
                        const BorderSide(color: Colors.teal, width: 0.75),
                  ),
                ),
                onChanged: (String value) {
                  setState(() {
                    searchFor = value;
                    searchForLength = value.length;
                    print(searchForLength);
                    search();
                  });
                },
              ),
            ),
            GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 100,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              offset: Offset(2, 1),
                              color: Colors.grey)
                        ]),
                    height: 30,
                    width: 30,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            macros[index],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(attributes[index],
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  );
                }),
            ElevatedButton(
                onPressed: searchFor == null || searchFor.length == 0
                    ? () {}
                    : addFood,
                child: searchFor == null || searchFor.length == 0
                    ? Text('Search for an item')
                    : Text('Add this item')),
            Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1, blurRadius: 10, offset: Offset(3, 3))
                  ],
                  color: Colors.red,
                ),
                margin: EdgeInsets.only(top: 10),
                height: 325,
                child: Image.asset('assets/images/food-pyramid.jpg')),
          ],
        ),
      ),
      previewChild: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.orange[300],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          children: <Widget>[
            Container(
              width: 40,
              height: 6,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
      expandedChild: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.orange[300],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.keyboard_arrow_down,
              size: 30,
              color: Colors.white,
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: dbMacros.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 20, color: Colors.grey)
                                    ]),
                                margin: EdgeInsets.only(left: 10, top: 10),
                                height: 150,
                                width: 150,
                                child: Center(
                                    child: Text(dbMacros[index].itemName,
                                        style: GoogleFonts.exo2(
                                          textStyle: TextStyle(
                                              fontSize: 30, color: Colors.grey),
                                        ))),
                              ),
                              SizedBox(height: 40),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 20, color: Colors.grey)
                                      ]),
                                  margin: EdgeInsets.only(left: 10),
                                  height: 150,
                                  width: 150,
                                  child: Center(
                                    child: Text(
                                      "Protein: ${dbMacros[index].protein}g\n" +
                                          "Carbs: ${dbMacros[index].carbohydrates}g\n" +
                                          "Fats: ${dbMacros[index].fats}g",
                                      style: GoogleFonts.exo2(
                                          textStyle: TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey)),
                                    ),
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 20, color: Colors.grey)
                                      ]),
                                  margin: EdgeInsets.only(left: 20, top: 100),
                                  height: 170,
                                  width: 170,
                                  child:
                                      SfCircularChart(series: <CircularSeries>[
                                    // Render pie chart
                                    PieSeries<ChartData, String>(
                                        dataSource: chartData,
                                        pointColorMapper: (ChartData data, _) =>
                                            data.color,
                                        xValueMapper: (ChartData data, _) =>
                                            data.x,
                                        yValueMapper: (ChartData data, _) =>
                                            data.y)
                                  ])),
                              Text(
                                '${dbMacros[index].calories} kcal',
                                style: GoogleFonts.exo2(
                                    textStyle: TextStyle(
                                        fontSize: 40, color: Colors.grey)),
                              )
                            ],
                          ),
                        ],
                      ))),
            )
          ],
        ),
      ),
      minExtent: 75,
      maxExtent: MediaQuery.of(context).size.height,
    ));
  }

  void search() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.calorieninjas.com/v1/nutrition?query=$searchFor'),
        headers: {
          'X-Api-Key': '3vQR5cW3H3OCxFumF5vQ2g==dSxEpDFd5GThLpt5',
        },
      );

      ItemModel itemModel = ItemModel.fromJson(jsonDecode(response.body));
      macros[0] = itemModel.macro[0].calories.toString();
      macros[1] = itemModel.macro[0].protein.toString();
      macros[2] = itemModel.macro[0].carbohydrates.toString();
      macros[3] = itemModel.macro[0].fatTotal.toString();
    } catch (e) {}
  }

  addFood() async {
    var MacroDBHelper = MainDatabase.instance;
    var currData = await MacroDBHelper.getAllMacro();
    print(currData.length);
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.calorieninjas.com/v1/nutrition?query=$searchFor'),
        headers: {
          'X-Api-Key': '3vQR5cW3H3OCxFumF5vQ2g==dSxEpDFd5GThLpt5',
        },
      );

      ItemModel itemModel = ItemModel.fromJson(jsonDecode(response.body));

      if (currData.length == 0) {
        DateTime dateTime = DateTime.now();
        print("DATE TIME $dateTime");
        Macro macro = Macro(
            id: 0,
            itemName: searchFor,
            calories: itemModel.macro[0].calories.toInt(),
            protein: itemModel.macro[0].protein.toInt(),
            carbohydrates: itemModel.macro[0].carbohydrates.toInt(),
            fats: itemModel.macro[0].fatTotal.toInt(),
            day: dateTime.day.toInt(),
            month: 07,
            year: 2021);

        await MacroDBHelper.addMacro(macro);
      } else {
        DateTime dateTime = DateTime.now();
        Macro macro = Macro(
            id: currData[currData.length - 1].id - 1,
            itemName: searchFor,
            calories: itemModel.macro[0].calories.toInt(),
            protein: itemModel.macro[0].protein.toInt(),
            carbohydrates: itemModel.macro[0].carbohydrates.toInt(),
            fats: itemModel.macro[0].fatTotal.toInt(),
            day: dateTime.day.toInt(),
            month: 07,
            year: 2021);

        await MacroDBHelper.addMacro(macro);
      }
    } catch (e) {}

    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => DietTrackerRerouter()));
  }

  Future<void> getMacroData() async {
    var dbHelper = MainDatabase.instance;
    var currData = await dbHelper.getAllMacro();
    print(currData.length);
    if (currData.length > 0) {
      setState(() {
        dbMacros = currData;
      });
    }
  }
}

class DietTrackerRerouter extends StatefulWidget {
  const DietTrackerRerouter({key}) : super(key: key);

  @override
  _DietTrackerRerouterState createState() => _DietTrackerRerouterState();
}

class _DietTrackerRerouterState extends State<DietTrackerRerouter> {
  @override
  void initState() {
    super.initState();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => DietTrackerScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color color;
}
