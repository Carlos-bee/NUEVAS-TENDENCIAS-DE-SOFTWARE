import 'package:parcial_1/src/register/register_controller.dart';
import 'package:parcial_1/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


class RegisterPage extends StatefulWidget {

  RegisterPage({Key? key}) : super(key: key);


  @override

  _RegisterPageState createState() => _RegisterPageState();

}


class _RegisterPageState extends State<RegisterPage> {

RegisterController _con = new RegisterController();


  @override

  void initState() {

    super.initState();

    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {

      _con.init(context, refresh);

    });

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

                        Positioned(

                          child: _circleRegister(),

                          left: -110,

                          top: -100,

                        ),

                        Positioned(

                          child: _textRegister(),

                          top: 52,

                          left: 16,

                        ),

                        Positioned(

                          child: _iconBack(),

                          top: 38,

                          left: -10,

                        ),

                        Container(

                          width: double.infinity,

                          margin: EdgeInsets.only(top: 120),
              child: SingleChildScrollView(
                child: Column(

                  children: [

                    _image_title_register(),

                    SizedBox(height: 15),

                     _textFieldEmail(),

                    _textFieldName(),

                    _textFieldLastName(),

                    _textFieldPhone(),

                    _textFieldPassword(),

                    _textFieldConfirmPassword(),

                    _buttonSubmit()

                  ],
                ),
               ),
              ),
            ],
          ),
        ),
      );
  }

  Widget  _image_title_register() {

    return GestureDetector(
      onTap: _con.showAlertDialog,
      child: CircleAvatar(
    
        backgroundImage: _con.imageFile != null
            ? FileImage(_con.imageFile!)
            : AssetImage('assets/img/user_profile_2.png')as ImageProvider,
    
          radius: 85,
    
        backgroundColor: Colors.grey[200],
    
        ),
    );

    

  }
  Widget _circleRegister() {

    return Container(

      width: 240,

      height: 240,

      decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(100),

          color: MyColors.primaryColor),

    );

  }

Widget _textFieldEmail() {

    return Container(

      margin: EdgeInsets.symmetric(horizontal: 60, vertical: 5),

      decoration: BoxDecoration(

          color: MyColors.primaryOpacityColor,

          borderRadius: BorderRadius.circular(10)),

      child: TextField(
        controller: _con.emailController,

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


  Widget _textFieldName() {

    return Container(

      margin: EdgeInsets.symmetric(horizontal: 60, vertical: 5),

      decoration: BoxDecoration(

          color: MyColors.primaryOpacityColor,

          borderRadius: BorderRadius.circular(10)),

      child: TextField(

        controller: _con.nameController,

        decoration: InputDecoration(

            hintText: 'Name',

            hintStyle: TextStyle(color: MyColors.primaryColorDark),

            border: InputBorder.none,

            contentPadding: EdgeInsets.all(15),

            prefixIcon: Icon(

              Icons.person,

              color: MyColors.primaryColor,

            )),

      ),

    );

  }


  Widget _textFieldLastName() {

    return Container(

      margin: EdgeInsets.symmetric(horizontal: 60, vertical: 5),

      decoration: BoxDecoration(

          color: MyColors.primaryOpacityColor,

          borderRadius: BorderRadius.circular(10)),

      child: TextField(

        controller: _con.lastNameController,

        decoration: InputDecoration(

            hintText: 'Last Name',

            hintStyle: TextStyle(color: MyColors.primaryColorDark),

            border: InputBorder.none,

            contentPadding: EdgeInsets.all(15),

            prefixIcon: Icon(

              Icons.person_outline,

              color: MyColors.primaryColor,

            )),

      ),

    );

  }

Widget _textFieldPhone() {

    return Container(

      margin: EdgeInsets.symmetric(horizontal: 60, vertical: 5),

      decoration: BoxDecoration(

          color: MyColors.primaryOpacityColor,

          borderRadius: BorderRadius.circular(10)),

      child: TextField(

        keyboardType: TextInputType.phone,

        controller: _con.phoneController,

        decoration: InputDecoration(

            hintText: 'Telefono',

            hintStyle: TextStyle(color: MyColors.primaryColorDark),

            border: InputBorder.none,

            contentPadding: EdgeInsets.all(15),

            prefixIcon: Icon(

              Icons.phone,

              color: MyColors.primaryColor,

            )),

      ),

    );

  }



  Widget _textFieldPassword() {

    return Container(

      margin: EdgeInsets.symmetric(horizontal: 60, vertical: 5),

      decoration: BoxDecoration(

          color: MyColors.primaryOpacityColor,

          borderRadius: BorderRadius.circular(10)),

      child: TextField(

         obscureText: true,

        controller: _con.passController,

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


  Widget _textFieldConfirmPassword() {

    return Container(

      margin: EdgeInsets.symmetric(horizontal: 60, vertical: 5),

      decoration: BoxDecoration(

          color: MyColors.primaryOpacityColor,

          borderRadius: BorderRadius.circular(10)),

      child: TextField(

        obscureText: true,

        controller: _con.confirmPassController,

        decoration: InputDecoration(

            hintText: 'Confirm Password',

            hintStyle: TextStyle(color: MyColors.primaryColorDark),

            border: InputBorder.none,

            contentPadding: EdgeInsets.all(15),

            prefixIcon: Icon(

              Icons.lock_outline,

              color: MyColors.primaryColor,

            )),

      ),

    );

  }


  Widget _buttonSubmit() {

    return Container(

      width: double.infinity,

      margin: EdgeInsets.symmetric(horizontal: 60, vertical: 20),

      child: ElevatedButton(

        onPressed: _con.isEnable! ? 
        
        _con.register : null,

        child: Text('REGISTER'),

        style: ElevatedButton.styleFrom(

            primary: MyColors.primaryColor,

            shape:

                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

            padding: EdgeInsets.symmetric(vertical: 15)),

      ),

    );

  }
  Widget _iconBack() {

    return IconButton(

        onPressed: _con.back,

        icon: Icon(

          Icons.arrow_back_ios,

          color: Colors.white,

        ));

  }


  Widget _textRegister() {

    return Text(

      'LOGIN',

      style: TextStyle(

          color: Colors.white,

          //

          fontWeight: FontWeight.bold,

          //

          fontSize: 20,

          fontFamily: 'NimbusSans'),

    );

  }
  void refresh() {

    setState(() {});

  }
}

