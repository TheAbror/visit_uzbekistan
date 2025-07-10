part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<String> filterItemsAll;
  final List<String> filterItemsSelected;
  //
  final SuperBlocProgress<List<SingleItemResponse>> places;
  final SuperBlocProgress<List<SingleItemResponse>> usefulApps;
  final SuperBlocProgress<SingleItemResponse> singleUsefulApp;
  final List<SingleItemResponse> mustKnow;
  final SuperBlocProgress<ArticlesResponse> articles;
  final SuperBlocProgress<SingleItemResponse> singleArticle;
  final SuperBlocProgress<List<SingleItemResponse>> tours;
  final BlocProgress blocProgress;
  final String failureMessage;

  const HomeState({
    required this.filterItemsAll,
    required this.filterItemsSelected,
    required this.places,
    required this.usefulApps,
    required this.singleUsefulApp,
    required this.mustKnow,
    required this.articles,
    required this.tours,
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
        'Tours',
      ],
      filterItemsSelected: [
        'Must know',
        'Useful apps',
        'Places',
        'Articles',
        'Tours',
      ],
      places: SuperBlocProgress(model: []),
      articles: SuperBlocProgress(
        model: ArticlesResponse(articles: []),
      ),
      tours: SuperBlocProgress(model: []),
      singleArticle: SuperBlocProgress(
        model: SingleItemResponse(
          id: 0,
          name: '',
          location: '',
          info: '',
          shortDescription: '',
          photo: '',
          link: '',
          createdAt: '',
          updatedAt: '',
          type: '',
        ),
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
          type: '',
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
          type: '',
        ),

        //
        SingleItemResponse(
          id: 2,
          name: 'Tax refund in Uzbekistan',
          location: '',
          info: '',
          photo:
              'https://sherman.house.gov/sites/evo-subsites/sherman.house.gov/files/styles/evo_featured_image/public/featured_image/1140-claim-tax-refund-note.imgcache.rev_.web_.1140.655.jpg?h=ba18f007&itok=nY4n-yxx',
          shortDescription:
              'Foreign nationals will now be able to receive a for goods bought in Uzbekistan, thanks to the introduction of the Tax Free system at the country’s five international airports - Tashkent, Samarkand, Bukhara, Fergana and Urgench.',
          createdAt: '',
          updatedAt: '',
          isImageTiny: false,
          link:
              'https://www.uzairways.com/en/press-center/news/tax-free-how-tourists-can-get-refund-goods-purchased-uzbekistan',
          type: '',
        ),
      ],
      usefulApps: SuperBlocProgress(model: []),
      singleUsefulApp: SuperBlocProgress(
        model: SingleItemResponse(
          id: 0,
          name: '',
          location: '',
          info: '',
          shortDescription: '',
          photo: '',
          link: '',
          createdAt: '',
          updatedAt: '',
          type: '',
        ),
      ),
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  HomeState copyWith({
    List<String>? filterItemsAll,
    List<String>? filterItemsSelected,
    SuperBlocProgress<List<SingleItemResponse>>? places,
    SuperBlocProgress<List<SingleItemResponse>>? usefulApps,
    SuperBlocProgress<SingleItemResponse>? singleUsefulApp,
    List<SingleItemResponse>? mustKnow,
    SuperBlocProgress<ArticlesResponse>? articles,
    SuperBlocProgress<List<SingleItemResponse>>? tours,
    SuperBlocProgress<SingleItemResponse>? singleArticle,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return HomeState(
      filterItemsAll: filterItemsAll ?? this.filterItemsAll,
      filterItemsSelected: filterItemsSelected ?? this.filterItemsSelected,
      places: places ?? this.places,
      articles: articles ?? this.articles,
      tours: tours ?? this.tours,
      usefulApps: usefulApps ?? this.usefulApps,
      singleUsefulApp: singleUsefulApp ?? this.singleUsefulApp,
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
        singleUsefulApp,
        mustKnow,
        articles,
        tours,
        singleArticle,
        blocProgress,
        failureMessage,
      ];
}
