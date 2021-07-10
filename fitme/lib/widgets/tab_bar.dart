import 'package:flutter/material.dart';

class Diet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              flexibleSpace: TabBar(
                tabs: <Widget>[
                  Container(
                    height: 30.0,
                    child: Tab(
                      text: 'Breakfast',
                    ),
                  ),
                  Container(
                    height: 30.0,
                    child: Tab(
                      text: 'Lunch',
                    ),
                  ),
                  Container(
                    height: 30.0,
                    child: Tab(
                      text: 'Dinner',
                    ),
                  ),
                  Container(
                    height: 30.0,
                    child: Tab(
                      text: 'Snacks',
                    ),
                  ),
                ],
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.grey[400],
                indicatorWeight: 4.0,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Color.fromRGBO(215, 225, 255, 1.0),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                TabViewBase(
                  tabName: 'Breakfast',
                ),
                TabViewBase(
                  tabName: 'Lunch',
                ),
                TabViewBase(
                  tabName: 'Dinner',
                ),
                TabViewBase(
                  tabName: 'Snacks',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabViewBase extends StatelessWidget {
  final String tabName;

  TabViewBase({@required this.tabName});

  List<Widget> _renderItem(Size size) {
    return List<Widget>.generate(dishes.length, (index) {
      var tag = dishes[index]['title'] + index.toString();
      Exercise exercise = Exercise(
        image: dishes[index]['image'],
        title: dishes[index]['title'],
        time: dishes[index]['time'],
        difficult: dishes[index]['calories'],
      );
      return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        child: ImageCardWithBasicFooter(
          exercise: exercise,
          tag: tag,
          imageWidth: size.width,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20.0),
        width: size.width,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(219, 228, 255, 1.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Track my ' + this.tabName,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromRGBO(122, 158, 255, 1.0),
                    ),
                  ),
                  Icon(
                    Icons.add,
                    size: 25.0,
                    color: Color.fromRGBO(122, 158, 255, 1.0),
                  )
                ],
              ),
            ),
            Column(children: this._renderItem(size)),
          ],
        ),
      ),
    );
  }
}

class ImageCardWithBasicFooter extends StatelessWidget {
  final Exercise exercise;
  final String tag;
  final double imageWidth;

  ImageCardWithBasicFooter({
    @required this.exercise,
    @required this.tag,
    this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double localWidth = size.width * 0.75;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Hero(
          tag: this.tag,
          child: Container(
            width: this.imageWidth != null ? this.imageWidth : localWidth,
            height: 160.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
              image: DecorationImage(
                image: NetworkImage(this.exercise.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          width: this.imageWidth != null ? this.imageWidth : localWidth,
          margin: EdgeInsets.only(top: 10.0),
          child: Text(
            this.exercise.title,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 14.0),
          ),
        ),
        Container(
          width: this.imageWidth != null ? this.imageWidth : localWidth,
          margin: EdgeInsets.only(top: 5.0),
          child: Text(
            '${this.exercise.time}    |    ${this.exercise.difficult}',
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}

class Exercise {
  final String title, time, difficult, image;

  Exercise({
    @required this.title,
    @required this.time,
    @required this.difficult,
    @required this.image,
  });
}

List<Map> dishes = [
  {
    "image": "https://picsum.photos/200/300",
    "title": "Dish 01",
    "time": "25 min",
    "calories": "426 kCal"
  },
  {
    "image": "https://picsum.photos/200/300",
    "title": "Dish 02",
    "time": "10 min",
    "calories": "200 kCal"
  },
  {
    "image": "https://picsum.photos/200/300",
    "title": "Dish 03",
    "time": "40 min",
    "calories": "634 kCal"
  },
  {
    "image": "https://picsum.photos/200/300",
    "title": "Dish 04",
    "time": "60 min",
    "calories": "1.238 kCal"
  },
];
