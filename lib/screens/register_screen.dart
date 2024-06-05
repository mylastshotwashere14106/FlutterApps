import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tap2024/screens/login_screen.dart';
import 'package:tap2024/settings/custom_scaffold.dart';
import 'package:tap2024/settings/utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final _formSignupKey = GlobalKey<FormState>();

  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'Ingresa un email valido';
    }
    return null;
  }

  String? validatePhone(String? phone) {
    RegExp phoneRegex = RegExp(r'^(?:[+0]9)?[0-9]{10,15}$');
    final isPhoneValid = phoneRegex.hasMatch(phone ?? '');
    if (!isPhoneValid) {
      return 'Ingresa un número de telefono valido';
    }
    return null;
  }

  String? hasValidUrl(String? url) {
    String pattern =
        r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
    RegExp regExp = new RegExp(pattern);

    if (url?.length == 0) {
      return 'Ingresa url';
    } else if (!regExp.hasMatch(url!)) {
      return 'Ingresa una url valida';
    }
    return null;
  }

  String? validatePassword(String? value) {
    RegExp regex = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!.,@#\$&*~]).{6,}$');
    if (value!.isEmpty) {
      return 'Ingresa contraseña';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Ingresa contraseña valida\n';
      } else {
        return null;
      }
    }
  }

  Uint8List? _image;
  File? selectedIMage;
  
  bool agreePersonalData = true;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 1,
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: SingleChildScrollView(
                // get started form
                child: Form(
                  key: _formSignupKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // get started text
                      Text(
                        'Registro',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Stack(
                        children: [
                            _image != null ?
                         CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                        :
                        const CircleAvatar(
                        radius: 64,
                        backgroundImage: NetworkImage(
                            'https://cdn1.iconfinder.com/data/icons/mix-color-3/502/Untitled-7-1024.png'),
                      ),
                        //https://i.pinimg.com/736x/b1/2c/41/b12c41b49b61d4405121275ae7a8e168.jpg
                          //https://cdn1.iconfinder.com/data/icons/mix-color-3/502/Untitled-7-1024.png
                      Positioned(
                          bottom: -0,
                      left: 80,
                          child: IconButton(
                        onPressed: (){showImagePickerOption(context); },
                        icon: Icon(Icons.photo),
                      ),
                      ),
                        ]
                        
                      
                      ),
                      
                      const SizedBox(
                        height: 40.0,
                      ),
                      // full name
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa nombre';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          label: const Text('Nombre'),
                          hintText: 'Ingresar nombre',
                          hintStyle: const TextStyle(
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.blue, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.blue, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // email
                      TextFormField(
                        validator: validateEmail,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          label: const Text('Correo'),
                          hintText: 'Ingresa correo',
                          hintStyle: const TextStyle(
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.blue, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.blue, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // password
                      TextFormField(
                        //obscureText: true,
                        //obscuringCharacter: '*',
                        validator: validatePassword,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        maxLength: 15,
                        decoration: InputDecoration(
                          label: const Text('Contraseña'),
                          hintText: 'Ingresar contraseña',
                          hintStyle: const TextStyle(
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.blue, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.blue, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        validator: hasValidUrl,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          label: const Text('Cuenta GitHub'),
                          hintText: 'Ingresa cuenta GitHub',
                          hintStyle: const TextStyle(
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.blue, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.blue, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      //telefono
                      TextFormField(
                        validator: validatePhone,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        maxLength: 10,
                        decoration: InputDecoration(
                          label: const Text('Celular'),
                          hintText: 'Ingresa celular',
                          hintStyle: const TextStyle(
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.blue, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.blue, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      // i agree to the processing
                      Row(
                        children: [
                          Checkbox(
                            value: agreePersonalData,
                            onChanged: (bool? value) {
                              setState(() {
                                agreePersonalData = value!;
                              });
                            },
                            activeColor: Colors.deepPurple,
                          ),
                          const Text(
                            'Acepto el uso de mi ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          Text(
                            ' informacion personal',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // signup button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formSignupKey.currentState!.validate() &&
                                agreePersonalData) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Processing Data'),
                                ),
                              );
                            } else if (!agreePersonalData) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Por favor acepta el uso de informacion personal')),
                              );
                            }
                          },
                          child: const Text('Registrarse'),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      // sign up divider
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            child: Text(
                              'Sign up with',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.blue.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      // sign up social media logo
                      /* Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Logo(Logos.facebook_f),
                          Logo(Logos.twitter),
                          Logo(Logos.google),
                          Logo(Logos.apple),
                        ],
                      ),*/
                      const SizedBox(
                        height: 25.0,
                      ),
                      // already have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '¿Ya tienes una cuenta?',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const LoginScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Iniciar Sesión',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.blue[100],
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.5,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 70,
                            ),
                            Text("Gallery")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 70,
                            ),
                            Text("Camera")
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); //close the model sheet
  }

//Camera
  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

}
