import 'dart:io';

import 'package:cash_planer/pages/login/cubit/auth_cubit.dart';
import 'package:cash_planer/pages/login/shadow_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static const id = 'set_photo_screen';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  File? _image;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
      });
    } on PlatformException catch (e) {
      throw Exception(e);
    }
  }

  Future<File?> _cropImage({
    required File imageFile,
  }) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("images/background.jpg"),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(
            left: 60,
            right: 60,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 125,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(alignment: Alignment.bottomCenter, children: [
                      Center(
                          child: _image == null
                              ? const CircleAvatar(
                                  backgroundColor: Colors.yellow,
                                  backgroundImage:
                                      AssetImage('images/person.png'),
                                  radius: 90,
                                )
                              : CircleAvatar(
                                  foregroundImage: FileImage(_image!),
                                  radius: 90,
                                )),
                      Row(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    _pickImage(ImageSource.camera);
                                  });
                                },
                                child: const Icon(
                                  Icons.camera_alt,
                                  size: 25,
                                )),
                          ),
                          const SizedBox(
                            width: 70,
                          ),
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    _pickImage(ImageSource.gallery);
                                  });
                                },
                                child: const Icon(
                                  Icons.folder,
                                  size: 25,
                                )),
                          ),
                        ],
                      ),
                    ]),
                  ],
                ),
                Text('Name:',
                    style: TextStyle(
                      fontSize: 32,
                      color: const Color.fromRGBO(255, 233, 39, 1),
                      fontWeight: FontWeight.w700,
                      shadows: shadowBig(),
                    )),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _nameController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.3,
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.person_add,
                      size: 20,
                    ),
                    iconColor: Colors.green,
                    fillColor: Color.fromARGB(200, 255, 255, 255),
                    filled: true,
                  ),
                ),
                Text('Email:',
                    style: TextStyle(
                      fontSize: 32,
                      color: const Color.fromRGBO(255, 233, 39, 1),
                      fontWeight: FontWeight.w700,
                      shadows: shadowBig(),
                    )),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.3,
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      size: 20,
                    ),
                    iconColor: Colors.green,
                    fillColor: Color.fromARGB(200, 255, 255, 255),
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Password:',
                    style: TextStyle(
                      fontSize: 32,
                      color: const Color.fromRGBO(255, 233, 39, 1),
                      fontWeight: FontWeight.w700,
                      shadows: shadowBig(),
                    )),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _passwordController,
                  autocorrect: false,
                  enableSuggestions: false,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.3,
                    color: Colors.black,
                  ),
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_person,
                      size: 20,
                    ),
                    iconColor: Colors.green,
                    fillColor: Color.fromARGB(200, 255, 255, 255),
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 135,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<AuthCubit>().createUser(
                                email: _emailController.text,
                                password: _passwordController.text,
                                displayName: _nameController.text,
                                filePath: _image!.path,
                              );
                          context.go('/');
                        },
                        child: const Text('Register'),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    context.go('/login');
                  },
                  child: Text(
                    'Already have an account? Login.',
                    style: TextStyle(
                      fontSize: 18,
                      color: const Color.fromRGBO(255, 233, 39, 1),
                      shadows: shadowSmall(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
