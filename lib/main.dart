import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Colors.yellowAccent),
          child: Home(),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Container(
          height: 100,
          decoration: BoxDecoration(color: Colors.blueAccent),
        )),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned(
          top: 0,
          height: 100,
          width: screenWidth,
          child: Container(
            decoration: BoxDecoration(color: Colors.pinkAccent),
            child: TopTab(),
          ),
        ),
        Positioned(
          bottom: 0,
          width: 0.70 + screenWidth,
          height: 150,
          child: Container(
            decoration: BoxDecoration(color: Colors.redAccent),
          ),
        ),
        Positioned(
            right: 0,
            width: 0.25 + screenWidth,
            height: 0.3 + screenheight,
            top: 0.37 + screenheight,
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
            )),
        Positioned(
          bottom: 0,
          right: 0,
          width: 0.25 + screenWidth,
          height: 0.25 + screenheight,
          child:
              Container(decoration: BoxDecoration(color: Colors.purpleAccent)),
        )
      ],
    );
  }
}

class TopTab extends StatefulWidget {
  const TopTab({Key? key}) : super(key: key);

  @override
  State<TopTab> createState() => _TopTabState();
}

class _TopTabState extends State<TopTab> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(vsync: this, length: 2, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Icon(
            Icons.search,
            size: 30,
          ),
        ),
        Expanded(
          flex: 8,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            width: 240,
            child: TabBar(
              indicatorColor: Colors.white,
              labelStyle: TextStyle(color: Colors.white, fontSize: 25),
              unselectedLabelStyle:
                  TextStyle(color: Colors.grey[700], fontSize: 20),
              controller: _controller,
              tabs: <Widget>[Text("Đành cho bạn"), Text("Đang theo dõi")],
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Row(
            children: [
            SizedBox(width:20),
            Icon(
              Icons.live_tv,
              size: 30,
            )
          ]),
        ),
      ],
    );
  }
}

class BtmBar  extends StatelessWidget {
  const BtmBar ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: <Widget>[
        Expanded(flex: 1, child: Text("A"),),
        Expanded(flex: 1, child: Text("B"),),
        Expanded(flex: 1, child: Text("C"),),
        Expanded(flex: 1, child: Text("D"),),
        Expanded(flex: 1, child: Text("E"),),
        Expanded(flex: 1, child: Text("F"),),
      ],)
    );
  }
}
