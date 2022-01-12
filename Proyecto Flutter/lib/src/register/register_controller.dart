import 'dart:convert';
import 'dart:io';

import 'package:parcial_1/src/models/response_api.dart';
import 'package:parcial_1/src/models/user.dart';
import 'package:parcial_1/src/provider/user_provider.dart';
import 'package:parcial_1/src/utils/my_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class RegisterController {

  BuildContext? context;

  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  TextEditingController confirmPassController = new TextEditingController();
  UserProvider userProvider = new UserProvider();


  PickedFile? pickedFile;
  File? imageFile;
  Function? refresh;

  ProgressDialog? _progressDialog;
  bool? isEnable = true;

  Future? init(BuildContext context, Function refresh) {
    this.context = context;
    this.refresh = refresh;
    userProvider.init(context);
  }

  void register() async {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastName = lastNameController.text;
    String phone = phoneController.text.trim();
    String pass = passController.text.trim();
    String confirmPass = confirmPassController.text.trim();

    if (email.isEmpty ||
        name.isEmpty ||
        lastName.isEmpty ||
        phone.isEmpty ||
        pass.isEmpty ||
        confirmPass.isEmpty) {

      MySnackbar.show(context!, 'Debes Ingresar Todos los Datos');
      return;
    }

    if (pass != confirmPass) {
      MySnackbar.show(context!, 'Las Contraseñas no coinciden');
      return;
    }


    if (pass.length < 6) {
      MySnackbar.show(context!, 'Las Contraseña tiene menos de 6 Digitos');
      return;
    }

    if (imageFile == null) {

      MySnackbar.show(context!, 'Seleccona una imagen');

      return;

    }


    _progressDialog?.show(max: 100, msg: 'Espere un Momento...');

    isEnable = false;

    User user = new User(

        email: email,

        password: pass,

        name: name,

        lastname: lastName,

        phone: phone);


    Stream stream = await userProvider.createWithImage(user, imageFile!);


    stream.listen((res) {

      _progressDialog?.close();

      ResponseApi responseApi = ResponseApi.fromJson(json.decode(res));

      print('Respuesta: ${responseApi.toJson()} ');

      MySnackbar.show(context!, responseApi.message!);


      if (responseApi.success!) {

        Future.delayed(Duration(seconds: 4), () {

          Navigator.pushReplacementNamed(context!, 'login');

        });

      } else {

        isEnable = true;

      }

    });

  }


  Future selectImage(ImageSource imageSource) async {

    pickedFile = await ImagePicker().getImage(source: imageSource);


    if (pickedFile != null) {

      imageFile = File(pickedFile!.path);

    }


    Navigator.pop(context!);

    refresh!();

  }


  void showAlertDialog() {

    Widget galleryButton = ElevatedButton(

        onPressed: () {

          selectImage(ImageSource.gallery);

        },

        child: Text('Galeria'));

    Widget cameraButtom = ElevatedButton(

        onPressed: () {

          selectImage(ImageSource.camera);

        },

        child: Text('camara'));


    AlertDialog alertDialog = AlertDialog(

      title: Text('Selecciona tu Imagen'),

      actions: [galleryButton, cameraButtom],

    );


    showDialog(

        context: context!,

        builder: (BuildContext context) {

          return alertDialog;

        });

  }


  void back() {

    Navigator.pop(context!);

  }

}