import 'package:example/src/home/presentation/providers/home_provider.dart';
import 'package:example/src/home/presentation/widgets/data_widget.dart';
import 'package:example/src/home/presentation/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailSheet extends ConsumerWidget {
  const DetailSheet(this.url, {super.key});

  final String url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     
    final provider = ref.watch(homeProvider(url));

    return provider.when(
      data: DataWidget.new,
      error: (error, stackTrace) => Center(
        child: Text(error.toString()),
      ),
      loading: LoadingWidget.new,
    );
  }
}
