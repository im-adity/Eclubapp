import 'package:flutter/material.dart';
import 'package:lgoin/screens/authenticate/authenticate.dart';
import 'package:lgoin/screens/home/home.dart';
// import 'package:lgoin/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:lgoin/models/user.dart';

class Wrapper extends StatelessWidget {
  // bool loading = false;
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);
    //return either home or authenticate
    if(user == null){
      return Authenticate();
    }
    else{
      return /*loading ? Loading() : */Home();
    }
  }
}