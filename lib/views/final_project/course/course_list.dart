import 'package:flutter/material.dart';

import 'package:flutter_edspert/providers/course_provider.dart';
import 'package:provider/provider.dart';

class CourseList extends StatefulWidget {
  const CourseList({super.key});

  @override
  State<StatefulWidget> createState() => CourseListState();
}

class CourseListState extends State<CourseList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Provider.of<CourseProvider>(context).isLoading == true
                      ? const Text('Loading...')
                      : const Text('Fetch successfully'),
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(border: Border.all()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () => context.read<CourseProvider>().getAll(), child: const Text('Add')),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        )
      ],
    );
  }
}
