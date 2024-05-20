
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:tap2024/settings/value_listener.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Topicos Avanzados'),),
      drawer: menuLateral(context),
    );
  }
  Widget menuLateral(context){
    return  Drawer(
        child: Container(
          child: ListView(
            children:  [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    
                    image: AssetImage('assets/goku.jpg'))
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('https://pbs.twimg.com/media/FcgoxL2XEAAGbCK?format=jpg&name=large'),
                ),
                accountName: Text('Saga'), 
                accountEmail: Text('21030159@itcelaya.edu.mx')
                ),
              ListTile(
                tileColor: Color.fromARGB(255, 134, 10, 250),
                title: Text('Login'),
                subtitle: Text('Direccion de youtube'),
                leading: Icon(Icons.key),
                trailing: Icon(Icons.chevron_right),
                onTap: ()=>Navigator.pushNamed(context, '/login2'),
              ),
              ListTile(
                tileColor: Color.fromARGB(255, 134, 10, 250),
                title: Text('Intenciones'),
                subtitle: Text('Acciones implicitas'),
                leading: Icon(Icons.abc),
                trailing: Icon(Icons.chevron_right),
                onTap: ()=>Navigator.pushNamed(context, '/intent'),
              ),
              ListTile(
                tileColor: Color.fromARGB(255, 134, 10, 250),
                title: Text('Registrar'),
                subtitle: Text('Practica 7'),
                leading: Icon(Icons.abc),
                trailing: Icon(Icons.chevron_right),
                onTap: ()=>Navigator.pushNamed(context, '/register'),
              ),
              DayNightSwitcher(
                isDarkModeEnabled: ValueListener.isDark.value, 
                onStateChanged: (isDarkModeEnabled) {
                    ValueListener.isDark.value=isDarkModeEnabled;
                },
                )
            ],
          ),
        ),
    );
  }
}