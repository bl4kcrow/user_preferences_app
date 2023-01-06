import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_preferences_app/providers/theme_provider.dart';
import 'package:user_preferences_app/shared_preferences/preferences.dart';
import 'package:user_preferences_app/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  static const String routerName = 'Settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
      ),
      drawer: const SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Divider(),
              SwitchListTile.adaptive(
                onChanged: (newValue) {
                  setState(() {
                    Preferences.isDarkMode = newValue;
                  });
                  final themeProvider = Provider.of<ThemeProvider>(
                    context,
                    listen: false,
                  );

                  newValue
                      ? themeProvider.setDarkMode()
                      : themeProvider.setLightMode();
                },
                title: const Text('Dark Mode'),
                value: Preferences.isDarkMode,
              ),
              const Divider(),
              RadioListTile(
                groupValue: Preferences.gender,
                onChanged: (newValue) {
                  setState(() {
                    Preferences.gender = newValue ?? 1;
                  });
                },
                title: const Text('Male'),
                value: 1,
              ),
              const Divider(),
              RadioListTile(
                groupValue: Preferences.gender,
                onChanged: (newValue) {
                  setState(() {
                    Preferences.gender = newValue ?? 2;
                  });
                },
                title: const Text('Female'),
                value: 2,
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: Preferences.name,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    helperText: 'User name',
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      Preferences.name = newValue;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
