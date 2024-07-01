import 'package:cached_network_image/cached_network_image.dart';
import 'package:direct_link/direct_link.dart';
import 'package:example/src/home/presentation/widgets/quality_item.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

class DataWidget extends StatefulWidget {
  const DataWidget(this.data, {super.key});

  final SiteModel? data;

  @override
  State<DataWidget> createState() => _DataWidgetState();
}

class _DataWidgetState extends State<DataWidget> {
  Link? link;
  Map<String, List<Link>> links = {};

  @override
  void initState() {
    super.initState();
    final links = widget.data?.links ?? [];
    for (final e in links) {
      final type = e.type;

      if (this.links.containsKey(type)) {
        this.links[type]!.add(e);
      } else {
        this.links[type!] = [e];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      snap: true,
      expand: false,
      builder: (context, scrollController) {
        return ListView(
          controller: scrollController,
          padding: const EdgeInsets.all(10),
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.grey.shade400),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          widget.data?.thumbnail ?? '',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${widget.data?.title}'),
                      const SizedBox(height: 2),
                      Text(
                        '${widget.data?.duration}',
                        style: TextStyle(
                          fontSize: 10,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ListView.separated(
              shrinkWrap: true,
              itemCount: links.keys.length,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final e = links.keys.toList()[index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e),
                    const SizedBox(height: 4),
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: links[e]?.length ?? 0,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 6,
                        crossAxisSpacing: 6,
                        childAspectRatio: 2.4,
                      ),
                      itemBuilder: (context, index) {
                        final link = links[e]![index];

                        final isSelected = link == this.link;

                        return QualityItem(
                          link: link,
                          isSelected: isSelected,
                          onTap: () {
                            this.link = link;
                            setState(() {});
                          },
                        );
                      },
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            FilledButton(
              style: FilledButton.styleFrom(elevation: 0),
              onPressed: link == null ? null : onDownload,
              child: const Center(child: Text('Download')),
            ),
          ],
        );
      },
    );
  }

  Future<void> onDownload() async {
    final url = link!.link;

    final dir = await FilePicker.platform.getDirectoryPath();

    if (dir == null) return;

    await FlutterDownloader.enqueue(url: url, savedDir: dir);
  }
}
