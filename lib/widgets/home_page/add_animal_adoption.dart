import 'package:flutter/material.dart';

class AddAnimalAdoption extends StatefulWidget {
  const AddAnimalAdoption({super.key});

  @override
  State<AddAnimalAdoption> createState() => _AddAnimalAdoptionState();
}

bool? foradoption;
String? _dropDownValue;

// ignore: camel_case_types
class _AddAnimalAdoptionState extends State<AddAnimalAdoption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('app')),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('for Adoption'),
              Flexible(
                child: RadioListTile<bool>(
                  value: true,
                  groupValue: foradoption,
                  title: const Text('Yes'),
                  onChanged: (value) {
                    setState(() {
                      foradoption = value as bool;
                    });
                  },
                ),
              ),
              Flexible(
                child: RadioListTile<bool>(
                  value: false,
                  groupValue: foradoption,
                  title: const Text('No'),
                  onChanged: (value) {
                    setState(() {
                      foradoption = value as bool;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Vaccinated'),
              Flexible(
                child: RadioListTile<bool>(
                  value: true,
                  groupValue: foradoption,
                  title: const Text('Yes'),
                  onChanged: (value) {
                    setState(() {
                      foradoption = value as bool;
                    });
                  },
                ),
              ),
              Flexible(
                child: RadioListTile<bool>(
                  value: false,
                  groupValue: foradoption,
                  title: const Text('No'),
                  onChanged: (value) {
                    setState(() {
                      foradoption = value as bool;
                    });
                  },
                ),
              ),
            ],
          ),
          DropdownButton(
            hint: _dropDownValue == null
                ? const Text('Dropdown')
                : Text(
                    _dropDownValue!,
                    style: const TextStyle(color: Colors.blue),
                  ),
            isExpanded: true,
            iconSize: 30.0,
            style: const TextStyle(color: Colors.blue),
            items: ['Sulaymaniah', 'Erbil', 'Duhok', 'Halabja'].map(
              (val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                );
              },
            ).toList(),
            onChanged: (val) {
              setState(
                () {
                  _dropDownValue = val;
                },
              );
            },
          )
        ]),
      ),
    );
  }
}
