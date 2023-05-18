// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:reporting_app/services/auth/auth.service.dart'; 

class LoginFormWidget extends StatefulWidget {
  LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  bool _obscurePass = true;
  bool submit = false; 

  final _emailC = TextEditingController();

  final _passC = TextEditingController();

  void _toggleObscurePass() {
    setState(() {
      _obscurePass = !_obscurePass;
    });
  }

  void _submitForm() async {
    setState(() => submit = true);
    await Future.delayed(const Duration(milliseconds: 100));  
    setState(() => submit = false);
    context.read<AuthService>().login(context: context, email: _emailC.text, password: _passC.text); 
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 244, 244, 244),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(130, 128, 128, 128),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                const Icon(
                  Icons.alternate_email,
                  color: Color.fromARGB(255, 16, 18, 28),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      controller: _emailC,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 25),
        Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 244, 244, 244),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(130, 128, 128, 128),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                const Icon(
                  Icons.key,
                  color: Color.fromARGB(255, 16, 18, 28),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      controller: _passC,
                      obscureText: _obscurePass,
                      decoration: const InputDecoration(
                        hintText: 'Senha',
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => _toggleObscurePass(),
                  icon: Icon(
                    _obscurePass
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 35),
        GestureDetector(
          onTap: () => _submitForm(), 
          child: Container(
            width: double.infinity,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: !submit ? Color.fromARGB(255, 42, 97, 122) : Color.fromARGB(255, 21, 53, 68),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(130, 128, 128, 128),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Center(
                child: Text('Entrar',
                    style: GoogleFonts.oswald(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 230, 230, 230))),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
