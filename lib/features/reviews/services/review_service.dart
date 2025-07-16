import 'package:chopper/chopper.dart';
import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

part 'review_service.chopper.dart';

@ChopperApi(baseUrl: AppStrings.baseLive)
abstract class ReviewService extends ChopperService {
  static ReviewService create([ChopperClient? client]) =>
      _$ReviewService(client ?? ChopperClient());

  @Post(path: AppStrings.review)
  Future<Response<MobileResponse>> addReview(@Body() ReviewRequest body);

  //  @Get(path: '${AppStrings.timetable}?teacher_id={teacher_id}&id={id}')
  // Future<Response<TimetableResponse>> getTeacherInfo(
  //     {@Path('teacher_id') String? teacher_id, @Path('id') String? id});

  @Get(path: '${AppStrings.review}?model_type={model_type}&model_id={model_id}')
  Future<Response<ReviewsResponse>> getReviews(
    @Path('model_type') String model_type,
    @Path('model_id') int model_id,
  );
}
