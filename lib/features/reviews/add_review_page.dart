import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Writing a review'),
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(
              'assets/icons/close_icon.svg',
            ),
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => ReviewBloc(),
        child: BlocBuilder<ReviewBloc, ReviewState>(
          builder: (context, state) {
            return Stack(
              children: [
                ListView(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  children: [
                    SizedBox(height: 10.h),
                    Text(
                      'Please rate your experience',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: state.stars,
                    ),
                    Wrap(
                      children: List.generate(
                        state.stars.length,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              context
                                  .read<ReviewBloc>()
                                  .addStar(FilledStar(), index);
                            },
                            child:

                                // state.selectedStarIndex

                                EmptyStar(),
                            // child: state.stars,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Your review',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Container(
                      height: 144.h,
                      decoration: BoxDecoration(
                        color: Color(0XFFF0F2F5),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: TextField(
                        expands: true,
                        maxLines: null,
                        minLines: null,
                        textAlignVertical: TextAlignVertical.top,
                        controller: commentController,
                        decoration: decoration(),
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 16.w,
                  right: 16.w,
                  bottom: 32.h,
                  child: ActionButton(
                    text: 'Submit review',
                    onPressed: () {
                      context.read<ReviewBloc>().addReview();
                    },
                  ),
                )
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
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
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
          color: AppColors.primary,
          width: 1,
        ),
      ),
      filled: true,
      fillColor: Color(0XFFF0F2F5),
    );
  }
}

class EmptyStar extends StatelessWidget {
  const EmptyStar({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/star_empty.svg',
      height: 30.h,
      color: Color(0XFF121417),
    );
  }
}

class FilledStar extends StatelessWidget {
  const FilledStar({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/star_filled.svg',
      height: 30.h,
    );
  }
}


  // Row(
  //                     children: state.stars,
  //                   ),
  //                   Wrap(
  //                     children: List.generate(
  //                       1,
  //                       (index) {
  //                         return GestureDetector(
  //                           onTap: () {
  //                             context
  //                                 .read<ReviewBloc>()
  //                                 .addStar(FilledStar(), index);
  //                           },
  //                           child: Row(children: state.stars),
  //                         );
  //                       },
  //                     ),
  //                   ),