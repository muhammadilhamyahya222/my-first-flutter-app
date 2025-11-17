import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});

  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.0;
  String? menuItems = 'e1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title), // Using widget. because it's a StatefulWidget, if it were StatelessWidget, we could use just title 
        centerTitle: true
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // Column default is centered in X axis
            crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
            children: [
              DropdownButton(
                value: menuItems,
                items: [
                  DropdownMenuItem(value: 'e1', child: Text('Element 1')),
                  DropdownMenuItem(value: 'e2', child: Text('Element 2')),
                  DropdownMenuItem(value: 'e3', child: Text('Element 3')),
                ],
                onChanged: (String? value) {
                  setState(() {
                    menuItems = value;
                  });
                },
              ),
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
              /*
            Checkbox(
              // tristate: true, // Tristate allows null values, making the checkbox have three states: checked, unchecked, and indeterminate
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value;
                });
              },
            ),
            */
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
              /*
            Switch.adaptive(
              // adaptive makes it look native on both iOS and Android, not all widgets have adaptive version
              value: isSwitched,
              onChanged: (bool value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
            */
              SwitchListTile.adaptive(
                value: isSwitched,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
                title: Text('Switch me'),
              ),
              Slider.adaptive(
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
              InkWell(
                // Use Inkwell for clickable effect, and GestureDetector for more general use cases
                splashColor: Colors.teal, // Color when tapped
                highlightColor: Colors.white, // Color when held down
                onTap: () {
                  print('Image selected');
                },
                // child: Image.asset('assets/images/bg.jpg')
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.white12,
                ),
              ),
              ElevatedButton(
                // There is a lot of button types: ElevatedButton, TextButton, OutlinedButton, FilledButton, IconButton (like BackButton, CloseButton)
                onPressed: () {},
                child: Text('Click me'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
