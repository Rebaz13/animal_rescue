import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    super.key,
  });
  static List<String> people = [
    'John',
    'Paul',
    'George',
    'Ringo',
  ];
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[200],
            ),
            margin: const EdgeInsets.all(5),
            child: IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchPage(
                    onQueryUpdate: print,
                    items: people,
                    searchLabel: 'Search people',
                    suggestion: const Center(
                      child: Text('Filter people by name, surname or age'),
                    ),
                    failure: const Center(
                      child: Text('No person found :('),
                    ),
                    filter: (person) => [person],
                    sort: (a, b) => a.compareTo(b),
                    builder: (person) => ListTile(
                      title: Text(people[3]),
                      subtitle: Text(person[1]),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.search),
              color: Theme.of(context).primaryColor,
            )),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[200],
            ),
            margin: const EdgeInsets.all(5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_active),
              color: Theme.of(context).primaryColor,
            )),
      ],
    );
  }
}
