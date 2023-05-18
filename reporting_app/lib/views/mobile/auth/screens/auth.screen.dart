import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reporting_app/routes/mobile/app.routes.dart';
import 'package:reporting_app/views/mobile/auth/widgets/login.form.dart';

enum AuthMode { Signup, Login }

class AuthScreen extends StatelessWidget {
  final bool isLogin; 
  const AuthScreen({required this.isLogin, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 217, 217, 217),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: _size.height * 0.25,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 217, 217, 217)),
                ),
                const SizedBox(height: 20),
                Container(
                  height: _size.height * 0.7,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'Entrar',
                              style: GoogleFonts.oswald(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        //authform
                        Container(
                          height: _size.height * 0.35,
                          child: LoginFormWidget(),
                        ),
                        //const SizedBox(height: 15),
                        SizedBox(
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Recuperar senha',
                                style: GoogleFonts.oswald(
                                  fontSize: 17,
                                  color: const Color.fromARGB(255, 23, 43, 80),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                    context, MobileAppRoutes.auth.SIGNUP),
                                child: Text(
                                  'Não possui conta? Cadastre-se',
                                  style: GoogleFonts.oswald(
                                    fontSize: 18,
                                    color:
                                        const Color.fromARGB(255, 23, 43, 80),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
