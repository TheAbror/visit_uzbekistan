import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class DownloadWidget extends StatefulWidget {
  final int id;
  final SingleItemResponse newItem;

  const DownloadWidget({
    super.key,
    required this.id,
    required this.newItem,
  });

  @override
  State<DownloadWidget> createState() => _DownloadWidgetState();
}

class _DownloadWidgetState extends State<DownloadWidget> {
  late LocalStorage exisitngItems;

  @override
  void initState() {
    super.initState();

    exisitngItems = hiveBox.get(ShPrefKeys.localStorageItems) ??
        LocalStorage(localStorageItems: []);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        if (!exisitngItems.localStorageItems
            .any((e) => e.id == widget.newItem.id)) {
          await hiveBox.put(
            ShPrefKeys.localStorageItems,
            LocalStorage(
              localStorageItems: [
                ...exisitngItems.localStorageItems,
                widget.newItem.toSingleItemHiveModel(),
              ],
            ),
          );
        }
        showMessage('Added to downloads');
      },
      icon: exisitngItems.localStorageItems.any((e) => e.id == widget.id)
          ? Icon(IconsaxPlusBold.document_download)
          : Icon(IconsaxPlusLinear.document_download),
    );
  }
}
