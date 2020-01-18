import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lgoin/models/user.dart';
import 'package:lgoin/models/userField.dart';
import 'package:lgoin/services/database.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';

// String password;
// void passwordIs (String pass){
//   // password = "nbvsjbvhdbvjvnbsbvjhvdhvfhbsv";
//   password = pass;
// }
class QrCode extends StatefulWidget {
  final Function toggleView;
  final bool _show;
  final String password;

  QrCode(this.toggleView,this._show,this.password);

  @override
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  FirebaseUser user;
  // String password;
  @override
  Widget build(BuildContext context) {
    // final eclubIITK = Provider.of<List<EclubUser>>(context);
    // password = eclubIITK.
    // print(eclubIITK);
    // eclubIITK.forEach((userfield){
    //   if(user.email == userfield.email){
    //   print(userfield.password);
    //   password = userfield.password;
    //   print(userfield.email);
    //   }
    // });
            return Center(
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      if (widget._show) {
                        widget.toggleView();
                      }
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: Container(
                                width: 150.0,
                                height: 340.0,
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
                                    (widget.password != null)
                                      ?   QrImage(
                                            foregroundColor: Colors.white,
                                            backgroundColor: Colors.black,
                                            data: widget.password,
                                            version: QrVersions.auto,
                                            size: 200.0,
                                          )
                                        : SpinKitFoldingCube(
                                            size: 50.0,
                                            color: Colors.amber[800],
                                          ),
                                    // Text(widget.password,
                                    // style: TextStyle(
                                    //   color: Colors.white,
                                    //   fontSize: 20.0,
                                    // )),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 0.0, top: 5.0, left: 170.0),
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
                          });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(40.0)),
                    color: Colors.blueAccent[700],
                    splashColor: Colors.purpleAccent,
                    padding: const EdgeInsets.fromLTRB(14.0, 16.0, 16.0, 16.0),
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
            );
          // }
        // });
  }
}
