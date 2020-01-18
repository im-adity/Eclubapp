/*// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lgoin/models/user.dart';
import 'package:lgoin/screens/home/display/inentory.dart';
import 'package:lgoin/screens/home/display/qrcode_scan.dart';
// import 'package:lgoin/models/userField.dart';
// import 'package:lgoin/screens/authenticate/authenticate.dart';
// import 'package:lgoin/screens/home/drawer.dart';
// import 'package:lgoin/screens/home/qr_code.dart';
// import 'package:lgoin/screens/home/qr_scanner.dart';
// import 'package:lgoin/services/database.dart';
import 'package:lgoin/services/auth.dart';
import 'package:lgoin/services/database.dart';
import 'package:lgoin/shared/loading.dart';
import 'package:provider/provider.dart';
// import 'package:lgoin/shared/loading.dart';
// import 'package:provider/provider.dart';

// class Home extends StatelessWidget {
// final AuthService _auth = AuthService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey,
//       appBar: AppBar(
//         title: Text('Qr'),
//         backgroundColor: Colors.blue,
//         elevation: 0.0,
//         actions: <Widget>[
//           FlatButton.icon(
//             icon: Icon(Icons.person),
//             label: Text('Logout'),
//             onPressed: ()async {
//               await _auth.signOut();
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
class Home extends StatefulWidget {
  final AuthService _authe = AuthService();
  @override
  _HomeState createState() => _HomeState();
}
// FirebaseUser user;
// final DocumentReference documentReference= Firestore.instance.document("EclubIITK/UsersData");
// String nameUser;
//  void fetch(){
//   documentReference.get().then((datasnapshot){
//     if(datasnapshot.exists){
//       if(datasnapshot.data["Email"] == "${user.email}")
//       // setState(() {
//         nameUser = datasnapshot.data["Name"];
//       // });

//     }
//   });
// }

class _HomeState extends State<Home> {
  

  bool _showScreen = true;
  void changeScreen() {
    setState(() {
      _showScreen = !_showScreen;
    });
  }
  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you really want to exit?'),
        // content: new Text('Do you really want to exit'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes',
              style: TextStyle(
                color: Colors.lightGreenAccent[400]
              ),
            ),
          ),
          new FlatButton(
            color: Colors.amber[900],
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ) ?? false;
  }
  String password;

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<User>(context);

    return  /*WillPopScope(
      onWillPop: _onWillPop,
      child:*/
    /* StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        UserData userData = snapshot.data;
        password = userData.password;
        userData.password == null ? Loading() :*/ (_showScreen)?
        ProgressIndicator()
        GetQrCodeScan()
        : Inventory();
        
        
      
    
  }
}*/
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lgoin/models/user.dart';
// import 'package:lgoin/models/userField.dart';
// import 'package:lgoin/screens/authenticate/authenticate.dart';
import 'package:lgoin/shared/drawer.dart';
import 'package:lgoin/screens/home/display/qrscan_cde/qr_code.dart';
import 'package:lgoin/screens/home/display/qrscan_cde/qr_scanner.dart';
// import 'package:lgoin/services/database.dart';
import 'package:lgoin/services/auth.dart';
import 'package:lgoin/services/database.dart';
import 'package:lgoin/shared/loading.dart';
import 'package:provider/provider.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:provider/provider.dart';

// class Home extends StatelessWidget {
// final AuthService _auth = AuthService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey,
//       appBar: AppBar(
//         title: Text('Qr'),
//         backgroundColor: Colors.blue,
//         elevation: 0.0,
//         actions: <Widget>[
//           FlatButton.icon(
//             icon: Icon(Icons.person),
//             label: Text('Logout'),
//             onPressed: ()async {
//               await _auth.signOut();
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
class Home extends StatefulWidget {
  final AuthService _authe = AuthService();
  // final Function changeScreen;
  // final String password;
  // Home();

  @override
  _HomeState createState() => _HomeState();
}
// FirebaseUser user;
// final DocumentReference documentReference= Firestore.instance.document("EclubIITK/UsersData");
// String nameUser;
//  void fetch(){
//   documentReference.get().then((datasnapshot){
//     if(datasnapshot.exists){
//       if(datasnapshot.data["Email"] == "${user.email}")
//       // setState(() {
//         nameUser = datasnapshot.data["Name"];
//       // });

//     }
//   });
// }

class _HomeState extends State<Home> {
  bool _show = true;
  void toggleView() {
    setState(() {
      _show = !_show;
    });
  }

  // bool _sho = true;
  // void toggleVie() {
  //   setState(() {
  //     _show = !_show;
  //   });
  // }
  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you really want to exit?'),
            // content: new Text('Do you really want to exit'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text(
                  'Yes',
                  style: TextStyle(color: Colors.lightGreenAccent[400]),
                ),
              ),
              new FlatButton(
                color: Colors.amber[900],
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text(
                  'No',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }

  String password;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return /*StreamProvider<List<EclubUser>>.value(
      value: DatabaseService().eclubIITK,
      child: (DatabaseService().eclubIITK != null)
          ? */
        // if(userData.password == null)
        // if (!snapshot.hasData) {
        //   return CircularProgressIndicator(
        //     backgroundColor: Colors.orange,
        //   );
        // } else {

        // return
        /*userData.password == null
                  ? Loading()
                  : */ /*WillPopScope(
                      onWillPop: _onWillPop,
                   child:*/
                   StreamBuilder<UserData>(
                stream: /*user.uid == null ? null :*/ DatabaseService(uid: user.uid).userData,
                builder: (context, snapshot) {
                  // if (!snapshot.hasData) {
                  //   return CircularProgressIndicator(
                  //     backgroundColor: Colors.orange,
                  //   );
                  // } else {
                  UserData userData = snapshot.data;
                  userData == null ?Loading():
                  password = userData.password;
                  return 
        new Scaffold(
      appBar: AppBar(
        title: Text('Get or Scan Qr Code'),
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async {
              await widget._authe.signOut();
            },
          )
        ],
      ),
      drawer: Drawerlist(
        // changeScreen: widget.changeScreen(),
        selected1: true,
        selected2: false,
        selected3: false,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 170.0),
        color: Colors.black,
        // child: new ListView(
        //   // mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[

        child: ListView(
          children: <Widget>[
            (password == null)
                                  ? SpinKitFadingCircle(
                                      color: Colors.white,
                                    )
                                  : QrCode(toggleView,_show,password),

             /*Center(
                    child: Column(
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            if (_show) {
                              toggleView();
                            }
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    child: Container(
                                      width: 150.0,
                                      height: 400.0,
                                      color: Colors.grey[850],
                                      padding: EdgeInsets.all(0.0),
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Text('Your Qr Code:',
                                              style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 40.0,
                                              )),
                                          SizedBox(
                                            height: 15.0,
                                          ),
                                          (password != null)
                                              ? QrImage(
                                                  foregroundColor: Colors.white,
                                                  backgroundColor: Colors.black,
                                                  data: password,
                                                  version: QrVersions.auto,
                                                  size: 200.0,
                                                )
                                              : SpinKitFoldingCube(
                                                  size: 50.0,
                                                  color: Colors.amber[800],
                                                ),
                                          Text(password,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0,
                                              )),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 0.0,
                                                top: 5.0,
                                                left: 170.0),
                                            child: FlatButton(
                                              child: Text(
                                                'Cancel',
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.blueAccent[400],
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                            );
                          },
                                // );
                          // },
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(40.0)),
                          color: Colors.blueAccent[700],
                          splashColor: Colors.purpleAccent,
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 16.0, 16.0, 16.0),
                          child: Container(
                            height: 40.0,
                            width: 253.0,
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Icon(
                                    Icons.gradient,
                                    size: 35.0,
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 12.0),
                                  child: Text(
                                    "Get your Qr Code",
                                    style: TextStyle(
                                        fontSize: 25.0, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),*/
        //   ],
        // ),
                  // }
                // }),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'O',
                  style: TextStyle(color: Colors.white70, fontSize: 40.0),
                ),
                Text(
                  'R',
                  style: TextStyle(color: Colors.white70, fontSize: 32.0),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            /*(password == null)
                                  ? SpinKitFadingCircle(
                                      color: Colors.white,
                                    )
                                  :*/
            QrScanner(),
          ],
        ),
      ),
      // ),
    );
    // }
    // );

    // )
    // : Loading(),
    }
    // ),}
    );
  }
}
