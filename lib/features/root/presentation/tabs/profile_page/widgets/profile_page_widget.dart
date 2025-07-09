import 'package:flutter/cupertino.dart';
import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class EditProfileBiography extends StatelessWidget {
  final FocusNode textFieldFocusNode;

  const EditProfileBiography({
    super.key,
    required this.textFieldFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Request focus for the TextField when the container is tapped
        FocusScope.of(context).requestFocus(textFieldFocusNode);
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 96.h,
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 6.w,
        ),
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: EditProfileBoxDecoration(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TextField(
              // controller: TextEditingController(text: 'Biography'),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                hintText: 'About me',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Center ProfilePhoto(context, String photo) {
  return Center(
    child: GestureDetector(
      onTap: () async {
        await showDialog(
          context: context,
          builder: (_) => Dialog(
            child: Image.network(
              photo,
              width: 300.w,
              height: 300.h,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      behavior: HitTestBehavior.opaque,
      child: Stack(
        children: [
          ClipOval(
            child: Image.network(
              photo,
              width: 84.w,
              height: 84.w,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => showCupertinoModalPopup(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) => CupertinoActionSheet(
                  actions: [
                    CupertinoActionSheetAction(
                      child: const Text('Upload'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: const Text('Edit'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: const Text(
                        'Delete',
                        style: TextStyle(color: AppColors.error),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                  cancelButton: CupertinoActionSheetAction(
                    isDefaultAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.normal,
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                ),
              ),
              // child: Assets.icons.profile.editAccountIcon.svg(),
            ),
          ),
        ],
      ),
    ),
  );
}

class EditProfilePageItem extends StatelessWidget {
  final String label;
  final String text;
  final FocusNode textFieldFocusNode;

  const EditProfilePageItem({
    super.key,
    required this.label,
    required this.text,
    required this.textFieldFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(textFieldFocusNode);
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 6.w,
        ),
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: EditProfileBoxDecoration(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style:
                  TextStyle(color: Theme.of(context).colorScheme.surfaceTint),
            ),
            TextField(
              controller: TextEditingController(text: text),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration EditProfileBoxDecoration(BuildContext context) {
  return BoxDecoration(
    color: Theme.of(context).colorScheme.background,
    borderRadius: BorderRadius.circular(6.r),
    border: Border.all(
      color: Colors.grey.shade300,
      width: 2.w,
    ),
  );
}
