import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
            onEditingComplete: () {
              setState(() {});
            },
          ),
          Text('Hello, ${controller.text}'),
          Checkbox(
            // tristate: true,
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value;
              });
            },
          ),
          CheckboxListTile(
            // tristate: true,
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value;
              });
            },
            title: Text('Click me'),
          ),
          Switch(
            value: isSwitched,
            onChanged: (bool value) {
              setState(() {
                isSwitched = value;
              });
            },
          ),
          SwitchListTile(
            value: isSwitched,
            onChanged: (bool value) {
              setState(() {
                isSwitched = value;
              });
            },
            title: Text('Switch me'),
          ),
          Slider.adaptive( // adaptive makes it look native on both iOS and Android
            max: 10.0, // To set the maximum value of the slider
            value: sliderValue,
            divisions: 10, // To set the number of discrete divisions
            onChanged: (double value) {
              setState(() {
                sliderValue = value;
              });
              print('Slider value: $value');
            },
          ),
        ],
      ),
    );
  }
}
