import 'package:parcial_1/src/models/user.dart';
import 'package:parcial_1/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';


class RepartidorOrdersListController {

  BuildContext? context;

  SharedPref _sharedPref = new SharedPref();
  GlobalKey<ScaffoldState> Key = new GlobalKey<ScaffoldState>();

  User? user; 
  Function? refresh;

  Future? init(BuildContext context,Function refresh) async {

    this.context = context;
    this.refresh = refresh;
    user=User.fromJson(await _sharedPref.read('user'));
    refresh();
  }


  logout() {

    _sharedPref.logout(context!);

  }
  void openDrawer(){
    Key.currentState!.openDrawer();
  }
  void goToRoles(){
   Navigator.pushNamedAndRemoveUntil(context!, 'roles', (route) => false);
  }
}