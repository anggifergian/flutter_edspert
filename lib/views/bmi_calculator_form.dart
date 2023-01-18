import 'package:flutter/material.dart';

class BMICalculatorForm extends StatefulWidget {
  const BMICalculatorForm({super.key});

  @override
  State<StatefulWidget> createState() => BMICalculatorFormState();
}

class BMICalculatorFormState extends State<BMICalculatorForm> {
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

    if (value.length > 3 && num.parse(value) >= 200) {
      return 'Max 200';
    }

    return null;
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

    return Row(
      children: [
        Expanded(
            child: Column(
          children: [heightTextField],
        )),
        Expanded(
            child: Column(
          children: [weightTextField],
        ))
      ],
    );
  }
}
