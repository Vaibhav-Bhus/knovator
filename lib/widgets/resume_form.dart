import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:knovator/models/resume_item_model.dart';
import 'package:knovator/providers/resume_provider.dart';
import 'package:knovator/widgets/custom_toast.dart';
import 'package:provider/provider.dart';

class ResumeItemModelForm extends StatefulWidget {
  final int? index;

  const ResumeItemModelForm({super.key, this.index});

  @override
  State<ResumeItemModelForm> createState() => _ResumeItemModelFormState();
}

class _ResumeItemModelFormState extends State<ResumeItemModelForm> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    if (widget.index != null) {
      final resumeItemModel =
          context.read<ResumeProvider>().resumeItems[widget.index!];
      _titleController = TextEditingController(text: resumeItemModel.title);
      _contentController = TextEditingController(text: resumeItemModel.content);
    } else {
      _titleController = TextEditingController();
      _contentController = TextEditingController();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _contentController,
            decoration: const InputDecoration(labelText: 'Content'),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (_titleController.text.trim().isEmpty) {
                customToast('Title cannot be empty');
              }
              if (_contentController.text.trim().isEmpty) {
                customToast('Content cannot be empty');
              } else {
                final newResumeItemModel = ResumeItemModel(
                  title: _titleController.text,
                  content: _contentController.text,
                );

                if (widget.index != null) {
                  context
                      .read<ResumeProvider>()
                      .updateItem(widget.index!, newResumeItemModel);
                  customToast('Resume Item Updated');
                } else {
                  context.read<ResumeProvider>().addItem(newResumeItemModel);
                  customToast('Resume Item Added');
                }
                context.pushReplacement('/resumeviewer');
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
