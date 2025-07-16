// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ReviewService extends ReviewService {
  _$ReviewService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ReviewService;

  @override
  Future<Response<MobileResponse>> addReview(ReviewRequest body) {
    final Uri $url = Uri.parse('http://travel.getcontact.uz/api/review');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<MobileResponse, MobileResponse>($request);
  }

  @override
  Future<Response<ReviewsResponse>> getReviews(
    String model_type,
    int model_id,
  ) {
    final Uri $url = Uri.parse(
        'http://travel.getcontact.uz/api/review?model_type=${model_type}&model_id=${model_id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ReviewsResponse, ReviewsResponse>($request);
  }
}
