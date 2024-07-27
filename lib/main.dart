import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'res/constant/font.dart';
import 'view/home_screen.dart';
import 'view/qr_code_proivder.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      ChangeNotifierProvider(
        create: (context) => QRCodeProvider(), // Initialize your provider
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: TFont.ralewayBold,
              color: Colors.white,
              fontSize: 24),
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}


// RadialGradient(
//           colors: [Color(0xff24c6dc), Color(0xff514a9d)],
//           stops: [0, 1],
//           center: Alignment.centerRight,
//         )
        