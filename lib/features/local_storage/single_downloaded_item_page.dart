import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class SingleDownloadedItemPage extends StatefulWidget {
  final IdandTitle idandTitle;

  const SingleDownloadedItemPage({
    super.key,
    required this.idandTitle,
  });

  @override
  State<SingleDownloadedItemPage> createState() =>
      _SingleDownloadedItemPageState();
}

class _SingleDownloadedItemPageState extends State<SingleDownloadedItemPage> {
  late SingleItemResponse? item;

  @override
  void initState() {
    super.initState();

    final LocalStorage existingItems =
        hiveBox.get(ShPrefKeys.localStorageItems) ??
            LocalStorage(localStorageItems: []);

    final matchingItems = existingItems.localStorageItems.where(
      (e) => e.id == widget.idandTitle.id && e.type == widget.idandTitle.title,
    );

    item = matchingItems.isNotEmpty
        ? matchingItems.first.toSingleItemResponse()
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item?.name ?? ''),
        leading: SingleCityPageLeadingIcon(),
        actions: [
          // DownloadWidget(
          //   id: widget.idandTitle.id,
          //   newItem: item
          //   // ?? SingleItemResponse(id: id, name: name, location: location, info: info, photo: photo, shortDescription: shortDescription, createdAt: createdAt, updatedAt: updatedAt),
          // ),
        ],
      ),
      body: item == null
          ? Center(child: Text('Item not found'))
          : ListView(
              padding: EdgeInsets.zero,
              children: [
                CachedNetworkImage(
                  imageUrl: item?.photo ?? '',
                  height: 300.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    height: 300.h,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: 300.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/sign_in_bg.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: HtmlWidget(item?.info ?? ''),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: HtmlWidget(item?.shortDescription ?? ''),
                ),
                SizedBox(height: 10.h),
                if (item?.link?.isNotEmpty == true)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: ActionButton(
                      text: 'Open in the browser',
                      onPressed: () => openInBrowser(item?.link ?? ''),
                    ),
                  ),
                SizedBox(height: 40.h),
              ],
            ),
    );
  }
}
