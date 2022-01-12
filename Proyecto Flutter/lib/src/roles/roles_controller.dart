import 'package:flutter/material.dart';
import 'package:parcial_1/src/models/user.dart';
import 'package:parcial_1/src/utils/shared_pref.dart';

class RolesController{
  BuildContext? context;
  User? user;
  SharedPref _sharedPref = new SharedPref();
  Function? refresh;

  Future init(BuildContext context, Function refresh) async{
    this.context = context;
    this.refresh = refresh;
    user = User.fromJson(await _sharedPref.read('user'));
    refresh();
  }

  logout(){
    _sharedPref.logout(context!);
  }
void goToPage(String route){
  Navigator.pushNamedAndRemoveUntil(context!, route, (route) => false);
}


}