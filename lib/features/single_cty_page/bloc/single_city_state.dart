part of 'single_city_bloc.dart';

class SingleCityState extends Equatable {
  final SingleCityResponse response;
  final String failureMessage;
  final BlocProgress blocProgress;

  const SingleCityState({
    required this.response,
    required this.failureMessage,
    required this.blocProgress,
  });

  factory SingleCityState.initial() {
    return SingleCityState(
      response: SingleCityResponse(
        id: 0,
        name: '',
        info: '',
        location: '',
        photo: '',
        shortDescription: '',
        places: [
          SingleItemResponse(
            id: 1,
            name: "Itchan Kala",
            shortDescription:
                "Itchan Kala, Lorem Ipsum is simply dummy text of the printing and typesetting industry",
            location: 'Khiva, Uzbekistan',
            info:
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
            photo:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjMU-JAqZwWV-7A70O50PdXIMeVmzU7lCOhw&s',
            cityID: 1,
            createdAt: '2025-05-1812: 44: 48.000000Z',
            updatedAt: '2025-05-18T12:44:48.0000007',
          )
        ],
        restaurants: [
          SingleItemResponse(
            id: 1,
            name: "Gavhar",
            shortDescription: "about Gavhar",
            location: 'Urgench, Uzbekistan',
            info:
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
            photo:
                'https://avatars.mds.yandex.net/get-altay/9954022/2a00000188fcc5eb8c09cd54cba6e9e91d94/L_height',
            cityID: 1,
            createdAt: '2025-05-1812: 44: 48.000000Z',
            updatedAt: '2025-05-18T12:44:48.0000007',
          )
        ],
      ),
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  SingleCityState copyWith({
    SingleCityResponse? response,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return SingleCityState(
      response: response ?? this.response,
      failureMessage: failureMessage ?? this.failureMessage,
      blocProgress: blocProgress ?? this.blocProgress,
    );
  }

  @override
  List<Object?> get props => [
        response,
        blocProgress,
        failureMessage,
      ];
}
