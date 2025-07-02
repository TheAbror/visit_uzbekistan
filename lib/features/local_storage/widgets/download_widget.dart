import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class DownloadWidget extends StatefulWidget {
  final int id;
  final List<SingleItemResponse> newItems;

  const DownloadWidget({
    super.key,
    required this.id,
    required this.newItems,
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
        final SingleItemResponse singleItem = widget.newItems.firstWhere(
          (e) => e.id == widget.id,
          orElse: () => SingleItemResponse(
            id: -1,
            name: '',
            location: '',
            shortDescription: '',
            info: '',
            photo: '',
            createdAt: '',
            updatedAt: '',
          ),
        );

        if (singleItem.id != -1 &&
            !exisitngItems.localStorageItems
                .any((e) => e.id == singleItem.id)) {
          await hiveBox.put(
            ShPrefKeys.localStorageItems,
            LocalStorage(
              localStorageItems: [
                ...exisitngItems.localStorageItems,
                singleItem.toSingleItemHiveModel(),
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
