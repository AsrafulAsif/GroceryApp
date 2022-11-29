import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'home_page.dart';


class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    // system overlay
    OverlayState? overlayState = Overlay.of(context);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.dark, //navigation bar icons' color
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            //logo

            Padding(
              padding: const EdgeInsets.only(
                  left: 80.0, right: 80.0, bottom: 40.0, top: 100.0),
              child: Image.asset('lib/images/avocado.png'),
            ),

            //we deliver groceries at your door step

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                'We deliver groceries at your doorstep',
                style: GoogleFonts.notoSerif(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // fresh item everyday
            Text(
              'Fresh items everday',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const Spacer(),

            //get started Button
            GestureDetector(
              // onTap: (() {
              //   showTopSnackBar(
              //     overlayState!,
              //     const CustomSnackBar.info(
              //       message:
              //           'There is some information. You need to do something with that',
              //     ),
              //   );
              // }),
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => const HomePage()))),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(24),
                child: const Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
