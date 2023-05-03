import 'package:flutter/material.dart';
import '../../screens/shelter_admin/test.dart';
import '../../screens/login_register/login_ui.dart';

class bottomNavigation extends StatelessWidget {
  const bottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 1,
          backgroundColor: Colors.transparent,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {},
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: const Icon(Icons.star),
                onPressed: () {},
              ),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: const Icon(Icons.message),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AnimalForm()));
                },
              ),
              label: 'actions',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  Navigator.of(context).pushNamed(LoginUi.route);
                },
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
