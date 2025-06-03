import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class OutlineButtonsBottomSheet extends StatelessWidget {
  final bool addBottomPadding;
  final Color? backgroundColor;
  final List<Widget> children;

  const OutlineButtonsBottomSheet({
    super.key,
    required this.addBottomPadding,
    this.backgroundColor,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final double bottom = MediaQuery.of(context).padding.bottom;
    final double bottom2 = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      padding: const EdgeInsets.only(
        top: 8,
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: backgroundColor ?? Colors.white,
      ),
      child: SingleChildScrollView(
        child: Wrap(
          children: <Widget>[
            const BottomSheetTopIcon(),
            const SizedBox(height: 20),
            Column(children: children),
            Container(
              height: bottom + 16 + bottom2,
              color: backgroundColor ?? Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

class BottomSheetTopIcon extends StatelessWidget {
  const BottomSheetTopIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 5,
        width: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFBEC1C4),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
