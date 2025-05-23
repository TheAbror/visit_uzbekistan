part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<SingleItemResponse> cities;
  final List<SingleItemResponse> places;
  final List<SingleItemResponse> usefulApps;
  final BlocProgress blocProgress;
  final String failureMessage;

  const HomeState({
    required this.cities,
    required this.places,
    required this.usefulApps,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory HomeState.initial() {
    return HomeState(
      cities: [],
      places: [],
      usefulApps: [
        SingleItemResponse(
          id: 0,
          name: 'Telegram',
          location: '',
          info: '',
          photo:
              'https://static.vecteezy.com/system/resources/previews/018/930/484/non_2x/telegram-logo-telegram-icon-transparent-free-png.png',
          shortDescription:
              'Telegram, also known as Telegram Messenger, is a cloud-based, cross-platform, social media and instant messaging service. It was originally launched for iOS on 14 August 2013 and Android on 20 October 2013.',
          createdAt: '',
          updatedAt: '',
          isImageTiny: true,
        ),
        SingleItemResponse(
          id: 0,
          name: 'Yandex Maps',
          location: '',
          info: '',
          photo:
              'https://cdn-images-1.medium.com/max/684/1*YUmI4_xb-knD5xxordlfKA@2x.png',
          shortDescription:
              'Yandex Maps (Russian: Яндекс Карты, romanized: Yandeks Karty) is a Russian web mapping service developed by Yandex. The service provides detailed maps of the whole world, directions and estimated times of arrival for driving, walking, cycling, kick scooter, and public transportation navigation.',
          createdAt: '',
          updatedAt: '',
          isImageTiny: true,
        ),
        SingleItemResponse(
          id: 0,
          name: 'Fasten',
          location: '',
          info: '',
          photo:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREC1ZZ00pKRsE2hRijo-HSfT8hBJS4KnPMSfv2t9pDxgdZ9mzPqvTwn9YYMdhiux6Q-hY&usqp=CAU',
          shortDescription:
              'Fasten is a ride-hailing service, like Uber or Bolt, that allows users to request rides through a mobile app. It offers affordable rides, allows users to see the price in advance, and provides options for cash or card payments. The app also allows users to track their driver in real-time and offers detailed information about drivers and vehicles. ',
          createdAt: '',
          updatedAt: '',
          isImageTiny: false,
        ),
      ],
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  HomeState copyWith({
    List<SingleItemResponse>? cities,
    List<SingleItemResponse>? places,
    List<SingleItemResponse>? usefulApps,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return HomeState(
      cities: cities ?? this.cities,
      places: places ?? this.places,
      usefulApps: usefulApps ?? this.usefulApps,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        cities,
        places,
        usefulApps,
        blocProgress,
        failureMessage,
      ];
}
