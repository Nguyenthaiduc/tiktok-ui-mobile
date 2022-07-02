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
          decoration: BoxDecoration(color: Colors.grey[500]),
          child: Home(),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Container(
          height: 60,
          decoration: BoxDecoration(color: Colors.black),
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
            // decoration: BoxDecoration(color: Colors.pinkAccent),
            child: TopTab(),
          ),
        ),
        Positioned(
          bottom: 0,
          width: 0.70 + screenWidth,
          height: 140,
          child: Container(
            // decoration: BoxDecoration(color: Colors.redAccent),
            child: BtnContent(),
          ),
        ),
        Positioned(
            right: 0,
            width: 0.25 + screenWidth,
            height: 0.45 + screenheight,
            top: 0.32 + screenheight,
            child: Container(
                // decoration: BoxDecoration(color: Colors.deepOrangeAccent),
                child: getButtonList())),
        Positioned(
          bottom: 0,
          right: 0,
          width: 0.25 + screenWidth,
          height: 0.25 + screenheight,
          child: Container(
            // decoration: BoxDecoration(color: Colors.purpleAccent),
            child: RotateAlbum(),
          ),
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
  const BtnContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        ListTile(
            title: Text("ABC", style: TextStyle(color: Colors.white)),
            subtitle: Text("Hello Tiktok",
                style: TextStyle(color: Colors.white),
                maxLines: 3,
                overflow: TextOverflow.ellipsis)),
        Row(children: <Widget>[
          SizedBox(
            width: 10,
          ),
          Icon(Icons.music_note),
          Marquee(
            text: "BCDEF",
          ),
          // Flexible(
          //   child: Marquee(
          //     text: "ABC",
          //     style: TextStyle(fontWeight: FontWeight.bold),
          //     scrollAxis: Axis.horizontal,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     blankSpace: 20.0,
          //     velocity : 100.0,
          //     pauseAfterRound: Duration(seconds: 1),
          //     startPadding: 10.0,
          //     accelerationDuration: Duration(seconds: 1),
          //     accelerationCurve: Curves.linear,
          //     decelerationDuration: Duration(milliseconds: 500),
          //     decelerationCurve: Curves.easeOut,
          //   )
          // )
        ])
      ],
    ));
  }
}

class RotateAlbum extends StatefulWidget {
  const RotateAlbum({Key? key}) : super(key: key);

  @override
  State<RotateAlbum> createState() => _RotateAlbumState();
}

class _RotateAlbumState extends State<RotateAlbum>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  var animation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(_controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller.forward(from: 0.0);
            }
          }),
        child: Container(
          width: 60,
          height: 60,
          child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://st.quantrimang.com/photos/image/2021/09/23/AVT-Chibi-23.jpg")),
        ));
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: animation,
    );
  }
}

getButtonList() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Container(
        width: 60,
        height: 70,
        child: Stack(
          children: <Widget>[
            Container(
              width: 60,
              height: 60,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://vn.beincrypto.com/wp-content/uploads/2022/05/bic_artwork_Terra_Luna-1200x675.png"),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 17.5,
                child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Icon(Icons.add, size: 20, color: Colors.white)))
          ],
        ),
      ),
      // IconText(
      //   text: "999w",
      //   icon: Icon(Icons.favorite_border, size: 50, color: Colors.redAccent),
      // ),
      // IconText(
      //   text: "999w",
      //   icon: Icon(Icons.feedback, size: 50, color: Colors.white),
      // ),
      // IconText(
      //   text: "999w",
      //   icon: Icon(Icons.reply_all, size: 50, color: Colors.white),
      // ),
    ],
  );
}

class IconText extends StatelessWidget {
  final Icon icon;
  final String text;
  const IconText(this.icon, this.text, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          icon,
          Text(
            text,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
