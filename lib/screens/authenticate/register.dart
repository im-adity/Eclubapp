import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:lgoin/screens/home/drawer.dart';
// import 'package:lgoin/screens/home/home.dart';
// import 'package:lgoin/screens/home/qr_code.dart';
import 'package:lgoin/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:lgoin/services/crud.dart';
import 'package:lgoin/shared/loading.dart';


class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //text field state
  String email = "";
  String password = "";
  String error = "";
  String userName = "";
  String conPassword = "";
  bool loading = false;
  var _error = null;

  Widget showError(String error){
     if(error != ""){
               return SizedBox(height: 30.0,
                child:  Text(
                  error,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red, fontSize: 15.0),
                ),
                );
                }
      return SizedBox(height: 0.0,);
  }
  // crudMethods crudObject = crudMethods();
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0.0,
        title: Text('Register', textAlign: TextAlign.center,),
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.only(top: 20.0,bottom:20.0),
        child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                SizedBox(height:40.0),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      elevation: 8.0,
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10.0, right: 0.0, left: 0.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.person_pin,
                              color: Colors.white54,
                              size: 25.0,
                            ),
                            SizedBox(
                              width: 6.0,
                            ),
                            Text(
                              'Sign In',
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
                    SizedBox(
                      width: 6.0,
                    ),
                    FlatButton(
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),

                      splashColor: Colors.black,
                      // elevation: 8.0,
                      color: Colors.grey[850],
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, bottom: 15.0, right: 4.0, left: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.person_add,
                              color: Colors.white,
                              size: 25.0,
                            ),
                            SizedBox(
                              width: 6.0,
                            ),
                            Text(
                              'Register',
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
                  ],
                ),
                SizedBox(height: 18.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:50.0),
                  child: TextFormField(
                    validator: (val) => val.isEmpty ? 'Name' : _error,
                    onChanged: (val) {
                      setState(() {
                        userName = val;
                      });
                    },
                    decoration: InputDecoration(
                      focusColor: Colors.yellow,
                      labelText: "  Name",
                      labelStyle: TextStyle(
                        color: Colors.teal[100],
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(20.0),right: Radius.circular(20.0)),
                        borderSide: new BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
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
                  padding: EdgeInsets.symmetric(horizontal:50.0),
                  child: TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter an email' : /*(!val.contains('@') || !val.contains('.com')? 'Invalid Email' :*/  _error/*)*/ ,
                    onChanged: (val) {
                      setState(
                        () {
                          email = val;
                        },
                      );
                    },
                    decoration: InputDecoration(
                      focusColor: Colors.yellow,
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
                  ),
                ),
                SizedBox(height: 18.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:50.0),
                  child: TextFormField(
                    validator: (val) =>
                        val.length < 6 ? 'Enter a password 6+ chars long' : _error,
                    obscureText: true,
                    onChanged: (val) {
                      password = val;
                    },
                    decoration: InputDecoration(
                      focusColor: Colors.yellow,
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(20.0),right: Radius.circular(20.0)),
                        borderSide: new BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      labelText: "  Password",
                      labelStyle: TextStyle(
                        color: Colors.teal[100],
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
                  padding: EdgeInsets.symmetric(horizontal:50.0),
                  child: TextFormField(
                    validator: (val) =>
                        (val != password || val.isEmpty) ? 'Passwords does not match' : _error,
                    obscureText: true,
                    onChanged: (val) {
                      conPassword = val;
                    },
                    decoration: InputDecoration(
                      focusColor: Colors.yellow,
                      // enabledBorder: new InputBorder(),
                      labelText: "  Confirm Password",
                      labelStyle: TextStyle(
                        color: Colors.teal[100],
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(20.0),right: Radius.circular(20.0)),
                        borderSide: new BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
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
                SizedBox(height: 16.0),
               StreamBuilder(
                 stream: Firestore.instance.collection('EclubIITK').snapshots(),

                 builder: (context, snapshot) {
                   return Padding(
                     padding: EdgeInsets.symmetric(horizontal:50.0),
                     child: FlatButton(
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),

                            splashColor: Colors.deepPurple[900],
                            // elevation: 8.0,
                            color: Colors.deepPurpleAccent[400],
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15.0, bottom: 15.0, right: 4.0, left: 2.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.person_add,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                  SizedBox(
                                    width: 6.0,
                                  ),
                                  Text(
                                    'Register',
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
                                    .registerWithEmailAndPassword(userName,email, password);
                               
                                // getcredentials(userName,email);
                                // passwordIs(password);
                                if (result == null) {
                                  setState(() {
                                    _error = "Couldn\'t register";
                                    error = 'Please supply a valid email';
                                    loading = false;
                                    // _formKey.currentState.reset();
                                    // _formKey.currentState.;
                                    
                                  });
                                }
                                // else{
                                //   setState(() {
                                //     _error = null;
                                //   });
                                // }
                                // else{
                                  // fetch();
                                  // crudObject.add({
                                  // // Firestore.instance.collection("EclubIITK").add({
                                  //   "Name" : this.userName,
                                  //   "Email": this.email
                                  // }).catchError((e){
                                  //   print(e);
                                  // });
                                // }
                              }
                            },
                          ),
                   );
                 }
               ),
              showError(error),
              ],
            )),
      ),
    );
  }
}
