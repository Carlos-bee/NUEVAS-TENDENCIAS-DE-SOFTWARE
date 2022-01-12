import 'package:flutter/material.dart';
import 'package:parcial_1/src/cerveceria/orders/list/cerveceria_orders_list_page.dart';
import 'package:parcial_1/src/client/products/list/client_products_list_page.dart';
import 'package:parcial_1/src/login/login_page.dart';
import 'package:parcial_1/src/register/register_page.dart';
import 'package:parcial_1/src/repartidor/orders/list/repartidor_orders_list_page.dart';
import 'package:parcial_1/src/roles/roles_page.dart';
import 'package:parcial_1/src/utils/my_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);


  @override

  _MyAppState createState() => _MyAppState();

}


class _MyAppState extends State<MyApp> {

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      
        title:'Primer parcial App Fluter',
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',

      routes: {

        'login': (BuildContext context) => LoginPage(),
        'register': (BuildContext context) => RegisterPage(),
        'roles':(BuildContext context)=> RolesPage(),
        'client/products/list':(BuildContext context)=> ClientProductsListPage(),
        'cerveceria/orders/list':(BuildContext context)=>CerveceriaOrdersListPage(),
        'repartidor/orders/list':(BuildContext context)=>RepartidorOrdersListPage(),
      },
         theme: ThemeData(
           primaryColor: MyColors.primaryColor),
    );
       

  }

}