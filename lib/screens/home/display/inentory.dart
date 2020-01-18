import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lgoin/models/userField.dart';
// import 'package:lgoin/shared/drawer.dart';
import 'package:lgoin/services/auth.dart';
import 'package:lgoin/services/database.dart';
import 'package:lgoin/shared/drawer.dart';
import 'package:provider/provider.dart';

// class Inventor extends StatelessWidget {
//   @override
//   Widget
// }

// class Invent extends StatelessWidget {
//   final Function changeScreen;
//   @override
//   Widget build(BuildContext context) {
//     return Inventory();
//   }
// }

class Inventory extends StatefulWidget {
  final AuthService _authe = AuthService();
  // final Function changeScreen;
  Inventory();

  @override
  _InventoryState createState() => _InventoryState();
}

const _duration = Duration(milliseconds: 1400);
class _InventoryState extends State<Inventory> with TickerProviderStateMixin {
  AnimationController controller;

  Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1200));
    animation = Tween(begin: 0.0, end: 2 * pi).animate(controller);
  }
   

  void change() {
    setState(() {
      // color = randomColor();
      // borderRadius = randomBorderRadius();
      // margin = randomMargin();
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<EclubUser>>.value(
      value: DatabaseService().eclubIITK,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Inventory"),
          // actions: <Widget>[
          //           FlatButton.icon(
          //             icon: Icon(Icons.person),
          //             label: Text('Logout'),
          //             onPressed: () async {
          //               await widget._authe.signOut();
          //             },
          //           )
          //         ],
        ),
        // drawer: Drawerlist(changeScreen:widget.changeScreen(),selected1: false,selected2: true,selected3: false),
        body: Container(
          // color: Colors.black,
          // child: Center(
          //     child: Column(
          //   children: <Widget>[
          //     SpinKitFadingCube(
          //       itemBuilder: (BuildContext context, int index) {
          //         return DecoratedBox(
          //           decoration: BoxDecoration(
          //             shape: BoxShape.circle,
          //             color: (index % 2 == 0)
          //                 ? (Colors.blueAccent)
          //                 : Colors.orange,
          //           ),
          //         );
          //       },
          //     ),
          //     SizedBox(
          //       height: 50.0,
          //     ),
          //     SpinKitWave(
          //       size: 15.0,
          //       itemBuilder: (BuildContext context, int index) {
          //         return DecoratedBox(
          //           decoration: BoxDecoration(
          //             // shape: BoxShape.circle,
          //             color: (index.isEven) ? (Colors.indigoAccent[700]) : Colors.white,
          //             // shape: (

          //             // ),
          //           ),
          //         );
          //       },
          //     ),
          //     SizedBox(
          //       height: 50.0,
          //     ),
          //     AnimatedBuilder(
          //       animation: animation,
          //       child: Text(
          //         "aditya",
          //         style: TextStyle(
          //           fontSize: 50.0,
          //           color: Colors.white,
          //         ),
          //       ),
          //       builder: (context, child) {
          //         return Transform.rotate(
          //           child: Container(),
          //           angle: animation.value,
          //         );
          //       },
          //     ),
          //     SpinKitFadingCircle(
          //       size: 100.0,
          //       itemBuilder: (BuildContext context, int index) {
          //         return DecoratedBox(
          //           decoration: BoxDecoration(
          //             borderRadius: (index.isEven) ? BorderRadius.circular(10.0) : BorderRadius.circular(40.0),
          //             // shape:  BoxShape.circle : BoxShape.circle,
          //             color: Colors.tealAccent,
          //             // color: (index.isEven) ? (Colors.blue[200]) : Colors.white,
          //             // shape: (

          //             // ),
          //           ),
          //         );
          //       },
          //     ),
          //     SpinKitThreeBounce(color: Colors.tealAccent,
          //     size: 50.0,),
          //     // ListView(children: <Widget>[
          //       SizedBox(height: 50.0,),
          //     AnimatedContainer(
          //       duration: _duration,
          //       child: SpinKitCircle(color: Colors.white,
          //       ),
          //     ),
          //     RaisedButton(
          //       child: Text("dvbhcvbds",
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 30.0,
          //       ),),
          //       color: Colors.teal,
          //       onPressed: () => change(),
          //     )
          //     // ],
          //     // ),

      //       ],
      //     )),
        ),
      ),
    );
  }
}
