import 'package:visit_uzbekistan/widget_imports.dart';

class CustomAppBarBackButton extends StatelessWidget {
  final Function? func;

  const CustomAppBarBackButton({
    super.key,
    this.func,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (func != null) {
          func!();
        }
        Navigator.pop(context);
      },
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(),
      icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
    );
  }
}
