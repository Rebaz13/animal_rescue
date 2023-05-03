import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utils/app_images.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.red,
                    Colors.pink,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(AppImages.logo),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Account Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Rbeaz',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(
                'Account Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Rbeaz'),
            ),
            const Divider(
              thickness: 0.5,
            ),
            const ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(
                'Edit Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Edit'),
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.sunny),
              title: Text(
                'Dark Mode',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Switch(
                  value: true,
                  onChanged: (value) {
                    value = false;
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
