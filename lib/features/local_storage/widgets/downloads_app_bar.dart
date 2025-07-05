import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class DownloadsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DownloadsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Saved items'),
      leading: SingleCityPageLeadingIcon(),
      actions: [
        IconButton(
          onPressed: () async {
            final bool? isDelete = await deleteDialog(context);

            if (isDelete != null && isDelete) {
              await hiveBox.delete(ShPrefKeys.localStorageItems);
              await savedCitiesBox.delete(ShPrefKeys.localStorageSavedCity);
              showMessage('Deleted successfully');
            } else {
              showMessage('Something went wrong', isError: true);
            }
          },
          icon: Icon(IconsaxPlusLinear.box_remove),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
