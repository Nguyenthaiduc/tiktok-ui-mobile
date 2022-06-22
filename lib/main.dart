import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiktok-Demo',
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Colors.yellowAccent),
          child: Home(),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Container(
          height: 100,
          decoration: BoxDecoration(color: Colors.blueAccent),
          child: BtmBar(),
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
            // decoration: BoxDecoration(color: Colors.redAccent),
            child: BtnContent(),
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
          child: Row(children: [
            SizedBox(width: 20),
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

class BtmBar extends StatelessWidget {
  const BtmBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          getBtmTextWidget("A", true),
          getBtmTextWidget("B", false),
          AddIcon(),
          getBtmTextWidget("C", false),
          getBtmTextWidget("D", false),
        ],
      ),
    );
  }
}

class AddIcon extends StatelessWidget {
  const AddIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      height: 35,
      width: 60,
      child: Stack(
        children: <Widget>[
          Positioned(
            height: 35,
            width: 50,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.cyan, borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Positioned(
            height: 35,
            width: 50,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Positioned(
            height: 35,
            width: 50,
            right: 0,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(Icons.add)),
          ),
        ],
      ),
    );
  }
}

getBtmTextWidget(String content, bool ifSelected) {
  return Text("$content",
      style: ifSelected
          ? TextStyle(fontSize: 18, color: Colors.white)
          : TextStyle(fontSize: 18, color: Colors.grey[600]));
}

class BtnContent extends StatelessWidget {
  const BtnContent({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        ListTile(title: Text("ABC"),subtitle: Text("Hello Tiktok")),
        Row(children: <Widget>[
          Icon(Icons.music_note),
          Marquee(text: "BCDEF",), 
        ])
      ],)
    );
  }
}
