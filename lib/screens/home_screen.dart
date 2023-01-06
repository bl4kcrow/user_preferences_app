import 'package:flutter/material.dart';
import 'package:user_preferences_app/shared_preferences/preferences.dart';
import 'package:user_preferences_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routerName = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Is Dark Mode: ${Preferences.isDarkMode}'),
            const Divider(),
            Text('Genero: ${Preferences.gender}'),
            const Divider(),
            Text('Nombre: ${Preferences.name}'),
            const Divider(),
          ],
        ),
      ),
      drawer: const SideMenu(),
    );
  }
}
