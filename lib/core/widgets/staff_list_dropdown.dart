import 'package:visit_uzbekistan/widgets/widget_imports.dart';

class StaffListDropDown extends StatefulWidget {
  final TextEditingController involvedUsersController;
  final VoidCallback? onTap;
  final String hintText;

  const StaffListDropDown({
    super.key,
    required this.involvedUsersController,
    this.onTap,
    required this.hintText,
  });

  @override
  State<StaffListDropDown> createState() => _StaffListDropDownState();
}

class _StaffListDropDownState extends State<StaffListDropDown> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      readOnly: true,
      validator: (username) {
        if (username == null || username.isEmpty) {
          return 'Please select involved users title';
        }
        return null;
      },
      controller: widget.involvedUsersController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color:
                Theme.of(context).colorScheme.onPrimaryFixed.withOpacity(0.15),
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 1.w),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.stroke, width: 1.w),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.stroke, width: 1.w),
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: widget.hintText,
        fillColor: Theme.of(context).colorScheme.onBackground,
        hintStyle: const TextStyle(color: AppColors.textSecondary),
        suffixIcon: const SizedBox(
          height: 24,
          width: 24,
          child: Icon(Icons.arrow_drop_down_outlined),
        ),
      ),
    );
  }
}
