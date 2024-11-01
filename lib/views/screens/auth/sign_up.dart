import 'package:flutter/material.dart';
import 'package:tiktok/constants/constants.dart';
import 'package:tiktok/views/widgets/text_input_filed.dart';

class SignUpScree extends StatelessWidget {
  SignUpScree({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwrodController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Tik Tok clone',
            style: TextStyle(
              fontSize: 35,
              color: buttonColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Text(
            'Register',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          Stack(
            children: [
              const CircleAvatar(
                radius: 64,
                backgroundImage: NetworkImage(
                    'https://avatars.mds.yandex.net/i?id=c8179640fe7df90a5dcb098db20aedfec6caf86d98760e75-12518403-images-thumbs&n=13'),
                backgroundColor: Colors.black,
              ),
              Positioned(
                bottom: -1,
                left: 80,
                child: IconButton(
                  onPressed: () {
                    authController.pickImage();
                  },
                  icon: const Icon(
                    Icons.add_a_photo,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: TextInputField(
              controller: _usernameController,
              labelText: 'Enter your username',
              icon: Icons.person,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: TextInputField(
              controller: _emailController,
              labelText: 'Enter your email',
              icon: Icons.email,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: TextInputField(
              controller: _passwrodController,
              labelText: 'Enter your password',
              icon: Icons.password,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 50,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  5,
                ),
              ),
            ),
            child: InkWell(
              onTap: () => authController.registerUser(
                _usernameController.text,
                _emailController.text,
                _passwrodController.text,
                authController.profilePhot,
              ),
              child: const Center(
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Do uyou already have an account?',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              InkWell(
                onTap: () {
                  print('Navigating user');
                },
                child: Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 20,
                    color: buttonColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
