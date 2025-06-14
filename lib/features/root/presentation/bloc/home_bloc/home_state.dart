part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<String> filterItemsAll;
  final List<String> filterItemsSelected;
  //
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
        'Useful apps',
        'Places',
        'Articles',
      ],
      filterItemsSelected: [
        'Must know',
        'Useful apps',
        'Places',
        'Articles',
      ],
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
          link: 'https://uzbek-travel.com/visa/registration/',
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
          link: 'https://www.uzcaa.uz/en/drones',
        ),
        SingleItemResponse(
          id: 2,
          name: '16 things to know before visiting Uzbekistan',
          location: '',
          info: '',
          photo:
              'https://lp-cms-production.imgix.net/2023-08/GettyImages-1167036520.jpg?auto=format,compress&q=72&w=1440&h=810&fit=crop',
          shortDescription:
              'Uzbekistan is the Central Asian destination that you’ve been dreaming about. Magnificent blue-domed mosques, towering minarets, atmospheric Silk Road cities and ancient bazaars are coupled with the region’s best accommodation, easiest transportation and great value for money. It’s the most visited of the Central Asian republics and with good reason.',
          createdAt: '',
          updatedAt: '',
          isImageTiny: false,
          link:
              'https://www.lonelyplanet.com/articles/things-to-know-before-traveling-to-uzbekistan',
        ),
      ],
      usefulApps: [
        SingleItemResponse(
          id: 0,
          name: 'Telegram',
          location: '',
          info:
              'Telegram, also known as Telegram Messenger, is a cloud-based, cross-platform, social media and instant messaging service. It was originally launched for iOS on 14 August 2013 and Android on 20 October 2013.',
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
          info:
              'Yandex Maps (Russian: Яндекс Карты, romanized: Yandeks Karty) is a Russian web mapping service developed by Yandex. The service provides detailed maps of the whole world, directions and estimated times of arrival for driving, walking, cycling, kick scooter, and public transportation navigation.',
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
          info:
              'Fasten is a ride-hailing service, like Uber or Bolt, that allows users to request rides through a mobile app. It offers affordable rides, allows users to see the price in advance, and provides options for cash or card payments. The app also allows users to track their driver in real-time and offers detailed information about drivers and vehicles.',
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
          info:
              'Новый сервис доставки готовой еды из ресторанов Ташкента от экосистемы Uzum.',
          photo: 'https://api.logobank.uz/media/logos_png/Uzum_Tezkor-01.png',
          shortDescription:
              'Новый сервис доставки готовой еды из ресторанов Ташкента от экосистемы Uzum.',
          createdAt: '',
          updatedAt: '',
          isImageTiny: true,
        ),
        SingleItemResponse(
          id: 4,
          name: 'Uzrailways tickets',
          location: '',
          info:
              'Uzrailway tickets / УзЖД Билет – официальное приложение АО Ozbekiston Temir Yollari для покупки железнодорожных билетов.',
          photo:
              'https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/ee/69/11/ee691110-da17-0094-cbb0-5170bbe0f618/AppIcon-0-0-1x_U007emarketing-0-8-0-85-220.png/460x0w.webp',
          shortDescription:
              'Uzrailway tickets / УзЖД Билет – официальное приложение АО Ozbekiston Temir Yollari для покупки железнодорожных билетов.',
          createdAt: '',
          updatedAt: '',
          isImageTiny: true,
        ),
        SingleItemResponse(
          id: 5,
          name: 'Uzbekistan airways',
          location: '',
          info:
              'JSC Uzbekistan Airways, operating as Uzbekistan Airways, is the flag carrier of Uzbekistan, headquartered in Tashkent. From its hub at Islam Karimov Tashkent International Airport, the airline serves a number of domestic destinations; the company also flies international services to Asia, Europe and North America.',
          photo:
              'https://www.uzairways.com/sites/default/files/2023-08/%D0%BD%D0%B0%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5.jpg',
          shortDescription:
              'Uzrailway tickets / УзЖД Билет – официальное приложение АО Ozbekiston Temir Yollari для покупки железнодорожных билетов.',
          createdAt: '',
          updatedAt: '',
          isImageTiny: true,
        ),
        SingleItemResponse(
          id: 6,
          name: 'Silkavia',
          location: '',
          info:
              'Региональная авиакомпания Silk Avia 6 июля 2021года и является дочерней компанией АО «Uzbekistan Airports» Начало операционной деятельности запланировано на IV квартал 2022 года. Для полетов будут использоваться региональные самолеты ATR-72-600 с пассажиро-вместимостью до 70 человек. Маршрутная сеть – 40 маршрутов по всей республике до конца 2023 года по принципу point to hub (из столицы в регионы), но и по модели point to point (между регионами)',
          photo:
              'https://www.silk-avia.com/upload/iblock/f89/5mx2lvl8ciqvzds3hk09v7tuk8kp9m5s.jpg',
          shortDescription:
              'Региональная авиакомпания Silk Avia 6 июля 2021года и является дочерней компанией АО «Uzbekistan Airports» Начало операционной деятельности запланировано на IV квартал 2022 года. Для полетов будут использоваться региональные самолеты ATR-72-600 с пассажиро-вместимостью до 70 человек. Маршрутная сеть – 40 маршрутов по всей республике до конца 2023 года по принципу point to hub (из столицы в регионы), но и по модели point to point (между регионами)',
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
        places,
        usefulApps,
        mustKnow,
        articles,
        singleArticle,
        blocProgress,
        failureMessage,
      ];
}
