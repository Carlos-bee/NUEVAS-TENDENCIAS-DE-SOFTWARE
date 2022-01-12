

import 'package:parcial_1/src/utils/my_colors.dart';

import 'package:flutter/material.dart';

import 'package:flutter/scheduler.dart';

import 'login_cotroller.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override

  _LoginPageState createState() => _LoginPageState();

}


class _LoginPageState extends State<LoginPage> {
   LoginController _con = new LoginController();


  @override

  void initState() {

    

    super.initState();


      _con.init(context);

    

  }


  
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
      decoration: BoxDecoration(
  image: DecorationImage(image: AssetImage('assets/img/fondo.jpg'),
  fit: BoxFit.cover
  )
),
      width: double.infinity,
      child: Stack(
        children: [

          SingleChildScrollView(

            child: Column(

              children: [

                _imageTitle(),

                 _textFieldEmail(),

                _textFieldPassword(),

                _buttonLogin(),

                _textDontHaveAccount(),
              ],

            ),

          ),

        ],

      ),

    ));

  }


  Widget _textDontHaveAccount() {

    return Row(

      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        Text(

          'Remember me',

          style: TextStyle(color: MyColors.primaryColor),

        ),

        SizedBox(
          
          width: 50,

        ),

        GestureDetector(

          onTap: _con.goToRegisterPage,

          child: Text(

            'Forgot password?',

            style: TextStyle(

                fontWeight: FontWeight.bold, color: MyColors.primaryColor),
                

          ),

        )

      ],

    );

  }


  Widget _buttonLogin() {

    return Container(

      width: double.infinity,

      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),

      child: ElevatedButton(

        onPressed: _con.login,

        child: Text('LOGIN'),

        style: ElevatedButton.styleFrom(

            primary: MyColors.primaryColor,

            shape:

                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

            padding: EdgeInsets.symmetric(vertical: 15)),

      ),

    );

  }


  Widget _textFieldEmail() {

    return Container(

      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 2),

      decoration: BoxDecoration(

          color: MyColors.primaryOpacityColor,

          borderRadius: BorderRadius.circular(10)),

      child: TextField(
        controller: _con.emailController,
        keyboardType: TextInputType.emailAddress,

        decoration: InputDecoration(

            hintText: 'Email',

            hintStyle: TextStyle(color: MyColors.primaryColorDark),

            border: InputBorder.none,

            contentPadding: EdgeInsets.all(15),

            prefixIcon: Icon(

              Icons.email,

              color: MyColors.primaryColor,

            )),

      ),

    );

  }


  Widget _textFieldPassword() {

    return Container(

      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 50),

      decoration: BoxDecoration(

          color: MyColors.primaryOpacityColor,

          borderRadius: BorderRadius.circular(10)),

      child: TextField(
        obscureText: true,

        controller: _con.passwordController,

        decoration: InputDecoration(

            hintText: 'Password',

            hintStyle: TextStyle(color: MyColors.primaryColorDark),

            border: InputBorder.none,

            contentPadding: EdgeInsets.all(15),

            prefixIcon: Icon(

              Icons.lock,

              color: MyColors.primaryColor,

            )),

      ),

    );

  }


  Widget _imageTitle() {

    return Container(

      

      child: Image.asset(

        'assets/img/title_login.jpg',

        height: 420,

        width: 500,

      ),

    );

  }

}

