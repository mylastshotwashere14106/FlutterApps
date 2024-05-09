import 'package:flutter/material.dart';
import 'package:tap2024/screens/home_screen.dart';
import 'package:tap2024/screens/intenciones_screen.dart';
import 'package:tap2024/screens/login_screen_2.dart';
import 'package:tap2024/screens/popular_screen.dart';
import 'package:tap2024/screens/splash_screen.dart';
import 'package:tap2024/settings/theme_settings.dart';
import 'package:tap2024/settings/value_listener.dart';

void main() => runApp(const MyApp()); 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   ValueListenableBuilder(
      valueListenable: ValueListener.isDark,
      builder: (context,value,child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: PopularScreen(),
          theme: value 
          ? ThemeSettings.darkTheme(context) 
          : ThemeSettings.lightTheme(context),
          routes: {
            "/home":(context) => HomeScreen(),
            "/login2":(context) => LoginScreen2(),
            "/intent":(context) => IntencionesScreen()
          },
        );
      }
    );
  }
}































/*import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int contador=0;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stateful vs Stateless'),
        ),
        body: Center(
          child: Text('Valor del contador $contador'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.ads_click),
          onPressed: (){
            contador++;
            print(contador);
            setState(() {
              
            });
          }),
      ),
    );
  }
}*/