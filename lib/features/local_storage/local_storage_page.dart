import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class LocalStoragePage extends StatefulWidget {
  const LocalStoragePage({super.key});

  @override
  State<LocalStoragePage> createState() => _LocalStoragePageState();
}

class _LocalStoragePageState extends State<LocalStoragePage> {
  final LocalStorage exisitngItems =
      hiveBox.get(ShPrefKeys.localStorageItems) ??
          LocalStorage(localStorageItems: []);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved items'),
        actions: [
          IconButton(
            onPressed: () async {
              await hiveBox.delete(ShPrefKeys.localStorageItems);

              showMessage('Deleted');
            },
            icon: Icon(
              IconsaxPlusLinear.box_remove,
            ),
          ),
        ],
      ),
      body: exisitngItems.localStorageItems.isEmpty
          ? Center(child: Text('No data saved yet'))
          : GridView.builder(
              padding: EdgeInsets.only(
                left: defaultPadding,
                right: defaultPadding,
                top: 10.h,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.h,
                crossAxisSpacing: 8.h,
                childAspectRatio: 0.85,
              ),
              itemCount: exisitngItems.localStorageItems.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final singleItem = exisitngItems.localStorageItems[index];

                return GridViewItem(
                  item: singleItem.toSingleItemResponse(),
                );
              },
            ),
    );
  }
}
