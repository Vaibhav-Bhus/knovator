import 'package:flutter/material.dart';
import 'package:knovator/widgets/resume_form.dart';

class ResumeFormScreen extends StatelessWidget {
  final int? index;

  const ResumeFormScreen({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Item'),
      ),
      body: ResumeItemModelForm(index: index),
    );
  }
}
