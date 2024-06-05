
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:tap2024/settings/value_listener.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TAP'),),
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
                    
                    image: AssetImage('assets/purple.jpg'))
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/1/14/Wikipe-tan_holding_Russian_Libertarian_flag.png'),
                ),
                //https://upload.wikimedia.org/wikipedia/commons/1/14/Wikipe-tan_holding_Russian_Libertarian_flag.png
                  //https://pbs.twimg.com/media/FcgoxL2XEAAGbCK?format=jpg&name=large
                accountName: Text('Angel'),
                accountEmail: Text('21030374@itcelaya.edu.mx')
                ),
              ListTile(
                tileColor: Color.fromARGB(255, 134, 10, 250),
                title: Text('Registrar'),
                subtitle: Text(''),
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