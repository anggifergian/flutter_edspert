import 'package:flutter/material.dart';

class BMICalculatorForm extends StatefulWidget {
  const BMICalculatorForm({super.key});

  @override
  State<StatefulWidget> createState() => BMICalculatorFormState();
}

class BMICalculatorFormState extends State<BMICalculatorForm> {
  final _formKey = GlobalKey<FormState>();

  String? height;
  String? weight;

  String? validateInput(String? value) {
    if (value!.isEmpty) {
      return 'Required';
    }

    String numeric = r'(^[0-9]+$)';
    RegExp regExp = RegExp(numeric);
    if (!regExp.hasMatch(value)) {
      return 'Please input valid number';
    }

    if (value.length > 3 || num.parse(value) > 200) {
      return 'Max 200';
    }

    return null;
  }

  void handleSubmit() {
    var isValid = _formKey.currentState!.validate();

    if (isValid) {
      _formKey.currentState!.reset();
      setState(() {
        height = '';
        weight = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var heightTextField = TextFormField(
      onChanged: (value) => setState(() => height = value),
      validator: validateInput,
      decoration: const InputDecoration(
          label: Text('Height (cm)'),
          hintText: 'Please input your height',
          border: OutlineInputBorder()),
    );

    var weightTextField = TextFormField(
      onChanged: (value) => setState(() => weight = value),
      validator: validateInput,
      decoration: const InputDecoration(
          label: Text('Weight (kg)'),
          hintText: 'Please input your weight',
          border: OutlineInputBorder()),
    );

    var submitButton = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ElevatedButton(
            onPressed: handleSubmit,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Calculate',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.send,
                  size: 20,
                )
              ],
            ))
      ],
    );

    return Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
            key: _formKey,
            child: Column(
              children: [heightTextField, weightTextField, submitButton],
            )));
  }
}
