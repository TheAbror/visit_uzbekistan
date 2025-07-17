import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

//TODO from Figma design
class AddReviewPage extends StatefulWidget {
  const AddReviewPage({super.key});

  @override
  State<AddReviewPage> createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add review'),
        leading: SingleCityPageLeadingIcon(),
      ),
      body: BlocProvider(
        create: (context) => ReviewBloc(),
        child: BlocBuilder<ReviewBloc, ReviewState>(
          builder: (context, state) {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              children: [
                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    // color: AppColors.siginSecondaryTextColor,
                  ),
                  child: TextField(
                    controller: commentController,
                    decoration: decoration(),
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                ActionButton(
                  text: 'Submit review',
                  onPressed: () {
                    context.read<ReviewBloc>().addReview();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  InputDecoration decoration() {
    return InputDecoration(
      hintText: 'Comment',
      isDense: true,
      hintStyle: TextStyle(
        fontSize: 15.sp,
        color: AppColors.lightGrey,
        fontWeight: FontWeight.w500,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(
          color: Colors.blue,
          width: 1,
        ),
      ),
      filled: true,
      fillColor: AppColors.siginButtonsColor,
    );
  }
}
