import 'package:example/src/home/presentation/widgets/detail_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final url = TextEditingController(
    text: 'https://youtu.be/QND5HXyDQNQ?si=76WxhNlQGBtklKCk',
  );
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Direct Link'),
        actions: [
          CupertinoButton(
            child: const Icon(Icons.download),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                controller: url,
                style: const TextStyle(fontSize: 14),
                validator: (v) => v!.isEmpty ? 'required' : null,
                decoration: const InputDecoration(
                  filled: true,
                  isDense: true,
                  hintText: 'Paste link here...',
                  hintStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: onCheck,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    side: const BorderSide(),
                  ),
                ),
                child: const Center(child: Text('Check')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onCheck() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (!formKey.currentState!.validate()) return;

    final url = this.url.text.trim();

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      builder: (_) => DetailSheet(url),
    );
  }
}
