// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:lgoin/screens/home/home.dart';
import 'dart:async';
import 'dart:typed_data';
import 'package:qrscan/qrscan.dart' as scanner;

class QrScanner extends StatefulWidget {
  @override
  _QrScannerState createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  String barcode = '';
  Uint8List bytes = Uint8List(200);

  @override
  initState() {
    super.initState();
  }

  bool _show = true;
  bool loading = false;
  double width = 120.0;
  // Future<bool> _onBack() {
  //   return showDialog(
  //         context: context,
  //         builder: (context) => new AlertDialog(
  //           title: new Text('Are you really want to exit?'),
  //           // content: new Text('Do you really want to exit'),
  //           actions: <Widget>[
  //             new FlatButton(
  //               onPressed: () { Navigator.of(context).pop(true);
  //               loading =false;},
  //               child: new Text(
  //                 'Yes',
  //                 style: TextStyle(color: Colors.lightGreenAccent[400]),
  //               ),
  //             ),
  //             new FlatButton(
  //               color: Colors.amber[900],
  //               onPressed: () { Navigator.of(context).pop(false);
  //               loading = true;},
  //               child: new Text(
  //                 'No',
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ) ??
  //       false;
  // }
  String error = "";

  @override
  Widget build(BuildContext context) {
  
    return  Center(
        child: Column(
          children: <Widget>[
            
            RaisedButton(
              onPressed: () {
                
                _scan();
                loading =true;
              },
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0)),
              color: Colors.blueAccent[700],
              splashColor: Colors.purpleAccent[400],
              padding: const EdgeInsets.fromLTRB(14.0, 16.0, 16.0, 16.0),
              child: Container(
                height: 40.0,
                width: 253.0,
                child: loading ? SpinKitFadingCircle(
                    color: Colors.white,
                  ) : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.camera_alt,
                        size: 35.0,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Scan Qr Code",
                          style: TextStyle(
                            fontSize: 27.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(error,
                      style: TextStyle(color:Colors.red,
                      fontSize: 15.0,
                      ),
                      )
                    ],
                  ),
                // ),
              ),
            ),
          ],
        ),
      
    );
  }
  // }

  Future _scan() async {
    try{String barcode = await scanner.scan();
    setState(() {
          // scanner.scan() == null ? loading = false : 

      _show = !_show;
      this.barcode = barcode;
      loading = false;
    });
    }on FormatException{
      setState(() {
        loading = false;
      });
    }on PlatformException catch(e){
      if(e.code == scanner.CameraAccessDenied){
        setState(() {
          loading = false;
          error = "Camera Permission Required";
        });
        
      }
      else{
        setState(() {
          loading = false;
          error = "Unknown Error $e";
        });
      }
    }catch(e){
      loading = false;
      print(e);
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              width: 150.0,
              height: barcode.length < 22 ? 120.0 : 140.0,
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                          top: 15.0, left: 15.0, right: 15.0, bottom: 15.0),
                      child: Text(
                        '$barcode',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: barcode.length < 22
                              ? 22.0
                              : (barcode.length < 54 ? 18.0 : 15.0),
                        ),
                        textAlign: barcode.length <= 99 ? TextAlign.center : TextAlign.left,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          _scan();
                          Navigator.of(context).pop();
                        },
                        color: Colors.purpleAccent[700],
                        splashColor: Colors.purpleAccent,
                        padding: const EdgeInsets.fromLTRB(10.0, 2.0, 0.0, 3.0),
                        child: Container(
                          height: 20.0,
                          width: 130.0,
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 20.0,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Text(
                                  "Scan Again",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 3.0, top: 5.0, left: 2.0, right: 6.0),
                        child: FlatButton(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.blueAccent[400],
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            loading = false;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 6.0,
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
