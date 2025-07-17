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
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () async {
          if (!exisitngItems.localStorageItems.any(
            (e) => e.id == widget.newItem.id && e.type == widget.newItem.type,
          )) {
            await hiveBox.put(
              ShPrefKeys.localStorageItems,
              LocalStorage(
                localStorageItems: [
                  ...exisitngItems.localStorageItems,
                  widget.newItem.toSingleItemHiveModel(),
                ],
              ),
            );

            showMessage('Added to downloads');
          } else {
            showMessage('Could not save', isError: true);
          }
        },
        child: exisitngItems.localStorageItems.any(
          (e) => e.id == widget.id && e.type == widget.newItem.type,
        )
            ? Icon(IconsaxPlusBold.document_download)
            : Icon(
                IconsaxPlusLinear.document_download,
                color: Colors.black,
              ),
      ),
    );
  }
}
