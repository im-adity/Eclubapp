import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:lgoin/screens/authenticate/authenticate.dart';
// import 'package:lgoin/screens/home/drawer.dart';
// import 'package:lgoin/screens/home/home.dart';
import 'package:lgoin/services/auth.dart';
// import 'package:lgoin/screens/home/qr_code.dart';
import 'package:lgoin/shared/loading.dart';


class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error = "";
  String userName ="";
  bool loading = false;
  var _error = null;
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
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : 
    WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          elevation: 0.0,
          title: Text('Sign In'),
        ),
        body: Container(
          color: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 20.0,),
          child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 70.0),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                        elevation: 8.0,
                        color: Colors.grey[850],
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, bottom: 15.0, right: 9.0, left: 6.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.account_circle,
                                color: Colors.white,
                                size: 25.0,
                              ),
                              SizedBox(
                                width: 6.0,
                              ),
                              Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      RaisedButton(
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                        elevation: 8.0,
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 10.0, right: 4.0, left: 2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.person_add,
                                color: Colors.white54,
                                size:25.0,
                              ),
                              SizedBox(
                                width: 6.0,
                              ),
                              Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          widget.toggleView();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 25.0),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal:50.0),
                  //   child: TextFormField(
                  //     validator: (val) => val.isEmpty ? 'Name' : null,
                  //     onChanged: (val) {
                  //       setState(() {
                  //         userName = val;
                  //       });
                  //     },
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //     ),
                  //     decoration: InputDecoration(
                  //       focusColor: Colors.yellow,
                  //       labelText: "  Name",
                  //       labelStyle: TextStyle(
                  //         color: Colors.teal[100],
                  //       ),
                  //       errorBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.horizontal(left: Radius.circular(20.0),right: Radius.circular(20.0)),
                  //         borderSide: new BorderSide(
                  //           color: Colors.red,
                  //         ),
                  //       ),
                  //       focusedErrorBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.horizontal(left: Radius.circular(20.0),right: Radius.circular(20.0)),
                  //         borderSide: new BorderSide(
                  //           color: Colors.red,
                  //         ),
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.horizontal(left: Radius.circular(20.0),right: Radius.circular(20.0)),
                  //         borderSide: new BorderSide(
                  //           color: Colors.tealAccent,
                  //         ),
                  //       ),
                  //       enabledBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.horizontal(left: Radius.circular(20.0),right: Radius.circular(20.0)),
                  //         borderSide: new BorderSide(
                  //           color: Colors.tealAccent,
                  //           // width: 10.0,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:50.0),
                    child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        cursorColor: Colors.teal,
                        validator: (val) => val.isEmpty ? 'Enter an email' : (!val.contains('@')? 'Invalid Email' :  _error) ,
                        
                        decoration: InputDecoration(
                          labelText: "  Email",
                          labelStyle: TextStyle(
                            color: Colors.teal[100],
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(left: Radius.circular(20.0),right: Radius.circular(20.0)),
                          borderSide: new BorderSide(
                            color: Colors.red,
                          ),
                        ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(left: Radius.circular(20.0),right: Radius.circular(20.0)),
                            borderSide: new BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(left: Radius.circular(20.0),right: Radius.circular(20.0)),
                            borderSide: new BorderSide(
                              color: Colors.tealAccent,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(left: Radius.circular(20.0),right: Radius.circular(20.0)),
                            borderSide: new BorderSide(
                              color: Colors.tealAccent,
                            ),
                          ),
                        ),
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        }),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:50.0),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      validator: (val) =>
                          val.length < 6 ? 'Enter a password 6+ chars long' : _error,
                      obscureText: true,
                      onChanged: (val) {
                        password = val;
                      },
                      decoration: InputDecoration(
                        focusColor: Colors.yellow,
                        // enabledBorder: new InputBorder(),
                        labelText: "  Password",
                        labelStyle: TextStyle(
                          color: Colors.teal[100],
                        ),
                        
                        focusedErrorBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.horizontal(left: Radius.circular(20.0),right: Radius.circular(20.0)),
                          borderSide: new BorderSide(
                            
                            color: Colors.red,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(left: Radius.circular(20.0),right: Radius.circular(20.0)),
                          borderSide: new BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(left: Radius.circular(20.0),right: Radius.circular(20.0)),
                          borderSide: new BorderSide(
                            color: Colors.tealAccent,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(left: Radius.circular(20.0),right: Radius.circular(20.0)),
                          borderSide: new BorderSide(
                            color: Colors.tealAccent,
                            // width: 10.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                 
                  SizedBox(height: 18.0),
                  
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 50.0),
                     child: RaisedButton(
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                          elevation: 8.0,
                          splashColor: Colors.deepPurple[900],
                          color: Colors.deepPurpleAccent[400],
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0, bottom: 15.0, right: 5.0, left: 0.0),
                            child: loading ? SpinKitFadingCircle(
                              color: Colors.white,
                            ) : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.account_circle,
                                  color: Colors.white,
                                  size: 25.0,
                                ),
                                SizedBox(
                                  width: 6.0,
                                ),
                                Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                           onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() {

                                loading = true;
                              });
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              
                              if (result == null) {
                                setState(() {
                                  
                                  error =
                                      'Email / Password does not match';
                                      _error = "";
                                      loading = false;

                                });
                              }
                              // else{
                              //   setState(() {
                              //     _error = null;
                              //   });
                              // }
                            }
                          },
                        ),
                   ),
                   SizedBox(height: 18.0),
                  loading  ? SpinKitThreeBounce(
                    itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (index % 2 == 0)
                            ? (Colors.blueAccent)
                            : Colors.orange,
                      ),
                    );
                  },
                  ):

                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 15.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
