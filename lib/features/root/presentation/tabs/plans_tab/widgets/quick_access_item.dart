import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class QuickAccesssItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const QuickAccesssItem({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.float,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(width: 4.w),
              Text(
                text,
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
