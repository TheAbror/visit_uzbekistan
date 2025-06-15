import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class TransportPage extends StatefulWidget {
  final int id;

  const TransportPage({
    super.key,
    required this.id,
  });

  @override
  State<TransportPage> createState() => _TransportPageState();
}

class _TransportPageState extends State<TransportPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    context.read<TransportationBloc>().getRentalCars(widget.id);

    _pageController.addListener(() {
      final newIndex = _pageController.page?.round() ?? 0;
      if (newIndex != _currentPage) {
        setState(() {
          _currentPage = newIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text('Car Details'),
          // backgroundColor: Colors.transparent,
          ),
      body: BlocBuilder<TransportationBloc, TransportationState>(
        builder: (context, state) {
          if (state.blocProgress == BlocProgress.IS_LOADING) {
            return Center(child: CircularProgressIndicator());
          }

          if (state.blocProgress == BlocProgress.FAILED) {
            return const SomethingWentWrong();
          }

          final item = state.carRentals;

          return ListView(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 250,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return CachedNetworkImage(
                          imageUrl: item.photo,
                          height: 300.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            height: 300.h,
                            width: double.infinity,
                            color: Colors.grey[200],
                            child: Center(child: CircularProgressIndicator()),
                          ),
                          errorWidget: (context, url, error) => Container(
                            height: 300.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/sign_in_bg.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Index indicator
                  Positioned(
                    right: 16,
                    bottom: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${_currentPage + 1} / ${5}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      item.name,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    // Description
                    Text(
                      item.info,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey[800],
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 16.h),

                    ActionButton(
                      text: 'Book this car',
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
