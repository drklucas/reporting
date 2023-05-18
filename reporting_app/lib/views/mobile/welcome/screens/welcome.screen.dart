import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reporting_app/routes/mobile/app.routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 247, 247, 247)),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              // Column(
              //   children: [
              //     const SizedBox(height: 20),
              //     Container(
              //       color: Colors.red,
              //       width: double.infinity,
              //       height: _size.height * 0.25,
              //       // color: Colors.red,
              //     ),
              //   ],
              // ),
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Bem vindo! Faça seus registros na comunidade!',
                        style: GoogleFonts.oswald(
                          fontSize: 34,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 24, 24, 65),
                        ),
                        maxLines: 2,
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, MobileAppRoutes.auth.LOGIN),
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 42, 97, 122),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  'Acessar',
                                  style: GoogleFonts.oswald(
                                    fontSize: 20,
                                    color: const Color.fromARGB(
                                        255, 213, 220, 243),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 15.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color.fromARGB(255, 213, 220, 243),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        //),
      ),
    );
  }
}
