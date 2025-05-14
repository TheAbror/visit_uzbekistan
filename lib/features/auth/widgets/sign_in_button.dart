import 'package:visit_uzbekistan/widget_imports.dart';

class SignInButton extends StatelessWidget {
  final String text;
  final Widget icon;
  final VoidCallback onTap;

  const SignInButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(32),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: const [
            BoxShadow(
              color: Color(0XFF323140),
              offset: Offset(1, 1),
              blurRadius: 2,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            icon,
            Spacer(),
            Text(text),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
