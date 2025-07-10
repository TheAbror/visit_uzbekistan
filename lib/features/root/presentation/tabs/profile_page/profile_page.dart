import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final FocusNode _textFieldFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SingleCityPageLeadingIcon(),
            SizedBox(
              width: 256.w,
              child: Text(
                'Edit profile',
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
            ),
            // Assets.icons.courses.moreIcon.svg(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 32.h),
              ProfilePhoto(
                context,
                'https://t3.ftcdn.net/jpg/06/07/84/82/360_F_607848231_w5iFN4tMmtI2woJjMh7Q8mGvgARnzHgQ.jpg',
              ),
              SizedBox(height: 24.h),
              EditProfilePageItem(
                label: 'First name',
                text: 'Darlene',
                textFieldFocusNode: _textFieldFocusNode,
              ),
              EditProfilePageItem(
                label: 'Last name',
                text: 'Robinson',
                textFieldFocusNode: _textFieldFocusNode,
              ),
              EditProfilePageItem(
                label: 'Email',
                text: 'darline1984@gmail.com',
                textFieldFocusNode: _textFieldFocusNode,
              ),
              EditProfileBiography(textFieldFocusNode: _textFieldFocusNode),
              SizedBox(height: 24.h),
              ActionButton(
                text: 'Save',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 250.h),
            ],
          ),
        ),
      ),
    );
  }
}
