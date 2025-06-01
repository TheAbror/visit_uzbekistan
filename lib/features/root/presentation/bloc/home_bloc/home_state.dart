part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<String> filterItemsAll;
  final List<String> filterItemsSelected;
  //
  final List<SingleItemResponse> cities;
  final List<SingleItemResponse> places;
  final List<SingleItemResponse> usefulApps;
  final List<SingleItemResponse> mustKnow;
  final SuperBlocProgress<ArticlesResponse> articles;
  final SingleArticleResponse singleArticle;
  final BlocProgress blocProgress;
  final String failureMessage;

  const HomeState({
    required this.filterItemsAll,
    required this.filterItemsSelected,
    required this.cities,
    required this.places,
    required this.usefulApps,
    required this.mustKnow,
    required this.articles,
    required this.singleArticle,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory HomeState.initial() {
    return HomeState(
      filterItemsAll: [
        'Must know',
        'Cities',
        'Places',
        'Useful apps',
        'Articles',
      ],
      filterItemsSelected: [
        'Must know',
        'Cities',
        'Places',
        'Useful apps',
        'Articles',
      ],
      cities: [],
      places: [],
      articles: SuperBlocProgress(
        model: ArticlesResponse(articles: []),
      ),
      singleArticle: SingleArticleResponse(
        id: 0,
        title: '',
        desc: '',
        shortDescription: '',
        photo: '',
        url: '',
        createdAt: '',
        updatedAt: '',
      ),
      mustKnow: [
        SingleItemResponse(
          id: 0,
          name: 'Proof of Residence in Uzbekistan',
          location: '',
          info:
              'All foreign citizens visiting Uzbekistan on a temporary basis (whether they need a visa or not) must submit documents for registration at the place of residence within 72 hours upon arrival to Uzbekistan. Registration is not necessary if you arrive during weekends, holidays, or if your stay does not exceed three working days. Hotels automatically register your stay, but if you stay in a private home or apartment, you must register yourself via the website http://www.emehmon.uz/. Overnight train tickets serve as proof of your whereabouts. If you are camping or staying with friends for more than three nights, you must also register. The inviting party is responsible for ensuring guests are registered on time.',
          photo:
              'https://www.gazeta.uz/media/img/2021/10/94gUqr16339538042332_l.jpg',
          shortDescription:
              'Important information about registration for foreign visitors in Uzbekistan.',
          createdAt: '',
          updatedAt: '',
          isImageTiny: true,
        ),
        SingleItemResponse(
          id: 1,
          name: 'Drones are Not Allowed in Uzbekistan',
          location: '',
          info:
              'According to the Resolution of the Cabinet of Ministers No. 658 (November 15, 2022), the import, sale, purchase, storage, and use of drones and their spare parts are prohibited in Uzbekistan except for government-authorized entities. Only government agencies or those with explicit permits may import and operate drones, and these require authorization from Mininfocom and the Agency "Uzaviation". Unauthorized drones are not allowed in Uzbekistan.',
          photo:
              'https://img.safetysignsupplies.co.uk/highres/PU5861-L15-V-xl.png?status=user-zoom',
          shortDescription:
              'Understand Uzbekistan\'s strict regulations for drones and UAVs.',
          createdAt: '',
          updatedAt: '',
          isImageTiny: true,
        ),
      ],
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
          id: 1,
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
          id: 2,
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
        SingleItemResponse(
          id: 3,
          name: 'Uzum Tezkor',
          location: '',
          info: '',
          photo: 'https://api.logobank.uz/media/logos_png/Uzum_Tezkor-01.png',
          shortDescription:
              'Новый сервис доставки готовой еды из ресторанов Ташкента от экосистемы Uzum.',
          createdAt: '',
          updatedAt: '',
          isImageTiny: true,
        ),
      ],
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  HomeState copyWith({
    List<String>? filterItemsAll,
    List<String>? filterItemsSelected,
    List<SingleItemResponse>? cities,
    List<SingleItemResponse>? places,
    List<SingleItemResponse>? usefulApps,
    List<SingleItemResponse>? mustKnow,
    SuperBlocProgress<ArticlesResponse>? articles,
    SingleArticleResponse? singleArticle,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return HomeState(
      filterItemsAll: filterItemsAll ?? this.filterItemsAll,
      filterItemsSelected: filterItemsSelected ?? this.filterItemsSelected,
      cities: cities ?? this.cities,
      places: places ?? this.places,
      articles: articles ?? this.articles,
      usefulApps: usefulApps ?? this.usefulApps,
      mustKnow: mustKnow ?? this.mustKnow,
      singleArticle: singleArticle ?? this.singleArticle,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        filterItemsAll,
        filterItemsSelected,
        cities,
        places,
        usefulApps,
        mustKnow,
        articles,
        singleArticle,
        blocProgress,
        failureMessage,
      ];
}
