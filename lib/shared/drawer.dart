// import 'dart:html';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lgoin/models/user.dart';
// import 'package:lgoin/screens/authenticate/sign_in.dart';
// // import 'package:lgoin/models/userField.dart';
import 'package:lgoin/screens/home/home.dart';
import 'package:lgoin/screens/home/display/inentory.dart';
import 'package:lgoin/services/auth.dart';
import 'package:lgoin/services/database.dart';
import 'package:provider/provider.dart';
import './listtile.dart';

class Drawerlist extends StatefulWidget {
  final bool selected1;
  final bool selected2;
  final bool selected3;
  final Function changeScreen;
  Drawerlist({this.changeScreen,this.selected1, this.selected2, this.selected3});
  @override
  _DrawerlistState createState() => _DrawerlistState();
}

class _DrawerlistState extends State<Drawerlist> {
  FirebaseUser user;
  final AuthService _authe = AuthService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Widget firstName(context, String nameof) {
    if (nameof == null) {
      return SpinKitRotatingCircle(
        color: Colors.indigoAccent[700],
        size: 40.0,
      );
    }
    return Text(nameof[0].toUpperCase(),
        style: TextStyle(fontSize: 40.0, color: Colors.indigoAccent[700]));
  }

  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final eclubIITK = Provider.of<List<EclubUser>>(context);
    // print(eclubIITK);
    // eclubIITK.forEach((userfield){
    //   if(user.email == userfield.email){
    //   print(userfield.name);
    //   userName = userfield.name;
    //   print(userfield.email);
    //   userEmail = userfield.email;
    //   }
    // else {
    final user = Provider.of<User>(context);
    // }
    // });
    // return ListView.builder(
    //   itemCount: eclubIITK.length,
    //   itemBuilder: (context,index){
    // return MakeDrawer(eclubIITK: eclubIITK[index],state1 : widget.selected1,state2 : widget.selected2);
    return StreamBuilder<UserData>(
        stream: (user.uid != null)? DatabaseService(uid: user.uid).userData : null,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator(
              backgroundColor: Colors.orange,
            );
          } else {
            UserData userData = snapshot.data;

            return new Drawer(
              child: Container(
                color: Colors.black87,
                child: new ListView(
                  children: <Widget>[
                    Container(
                      width: 48.0,
                      height: 200.0,
                      padding: EdgeInsets.all(0.0),
                      color: Colors.indigo[900],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 80.0,
                            width: 80.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(80.0)),
                            ),
                            child: Center(
                              child: firstName(context, userData.name),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          userData.name != null
                              ? Text(
                                  userData.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                )
                              : SpinKitThreeBounce(
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                          SizedBox(
                            height: 1.0,
                            width: 20.0,
                          ),
                          userData.email != null
                              ? Text(
                                  userData.email,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                                )
                              : SpinKitThreeBounce(
                                  color: Colors.orange,
                                  size: 15.0,
                                ),
                        ],
                      ),
                    ),
                    TileList(widget.selected1, () {
                      // Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      widget.selected1
                          ? Navigator.of(context).pop(false)
                          : Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) => new Home()));
                          // : widget.changeScreen();
                    }, Icons.gradient, "Get or Scan Qr Code"),
                    TileList(widget.selected2, () {
                      Navigator.of(context).pop();
                      // Navigator.of(context).pop();
                     /* widget.selected2
                          ? Navigator.of(context).pop(false)
                          : */Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) => new Inventory()));
                          // : */widget.changeScreen();
                    }, Icons.list, "Inventory"),
                    Divider(
                      color: Colors.blueGrey,
                    ),
                    TileList(false, () async {
                      await _authe.signOut();
                      // Navigator.of(context).push(new MaterialPageRoute(
                      //         builder: (BuildContext context) => new SignIn()));
                    }, Icons.exit_to_app, "Logout"),
                  ],
                ),
              ),

              // ),
            );
          }
        });

    // );
  }
}

/*
Widget _buildList(BuildContext context , DocumentSnapshot document){
    return  Drawer(
      child: Container(
            color: Colors.black87,
            child: new ListView(
              children: <Widget>[
                Container(
                  width: 48.0,
                  height: 200.0,
                  padding: EdgeInsets.all(0.0),
                  color: Colors.indigo[900],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 80.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.all(Radius.circular(80.0)),
                        ),
                        child: Center(
                            child: Text(
                              firstName("Name"),
                              style: TextStyle(
                                color: Colors.indigoAccent[700],
                                fontSize: 40.0,
                              ),
                            ),
                          ),
                        
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        "Name",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: 1.0,width: 20.0,),
                      Text(
                        document["Email"],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
                TileList(widget.selected1, () {
                  Navigator.of(context).pop();
                  // Navigator.of(context).push(new MaterialPageRoute(
                  //     builder: (BuildContext context) =>
                  //         new Home()));
                }, Icons.gradient, "Get or Scan Qr Code"),
                TileList(widget.selected2, () {
                  Navigator.of(context).pop();
                  
                }, Icons.list, "Inventory"),
               
                Divider(
                  color: Colors.blueGrey,
                ),
                TileList(false, () async {
                    await _authe.signOut();
                }, Icons.exit_to_app, "Logout"),
              ],
            ),
          ),
    
      
    );

  }
    @override
  Widget build(BuildContext context) {
   return  StreamBuilder(
        stream: Firestore.instance.collection('EclubIITK').snapshots(),
        builder: (context, snapshot) {
           if(!snapshot.hasData) {
             print( snapshot.data);return CircularProgressIndicator();}
          return 
                  ListView.builder(
                          // itemCount: snapshot.data.documents.length,
                          itemBuilder: (context,index)=> _buildList(context,snapshot.data.documents[0]),
    );
        });
  }*/
