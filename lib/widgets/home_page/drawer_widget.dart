import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../screens/missing_pet.dart';
import '../../screens/test2.dart';
import './tempage.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  Widget listTile(
      BuildContext context, String title, Icon icon, Function() onTap) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          title: Text(title),
          leading: icon,
        ),
        const Divider(
          height: 1,
          thickness: 2,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue[900]!,
                Colors.blue[600]!,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Text(
                        'RA',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Rebaz Awat',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'email@gmail.com',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        listTile(context, 'account', const Icon(Icons.account_box_rounded), () {
          Get.to(() => MissingPetUi());
        }),
        listTile(context, 'favorite', const Icon(Icons.favorite), () {
          Get.to(() => MyHomePage());
        }),
      ]),
    );
  }
}
