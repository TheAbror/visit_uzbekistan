import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class ArticlePage extends StatefulWidget {
  final IdandTitle idandTitle;

  const ArticlePage({
    super.key,
    required this.idandTitle,
  });

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    context.read<HomeBloc>().getSingleArticle(widget.idandTitle.id);

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
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.idandTitle.title),
            leading: SingleCityPageLeadingIcon(),
            actions: [
              DownloadWidget(
                id: widget.idandTitle.id,
                newItem: state.singleArticle,
              ),
              SizedBox(width: 8.w),
            ],
          ),
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.blocProgress == BlocProgress.IS_LOADING) {
                return Center(child: CircularProgressIndicator());
              }

              return ListView(
                padding: EdgeInsets.zero,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 250.h,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return CachedNetworkImage(
                              imageUrl: state.singleArticle.photo,
                              height: 300.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                height: 300.h,
                                width: double.infinity,
                                color: Colors.grey[200],
                                child:
                                    Center(child: CircularProgressIndicator()),
                              ),
                              errorWidget: (context, url, error) => Container(
                                height: 300.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/sign_in_bg.jpg'),
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
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: HtmlWidget(state.singleArticle.info),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: ActionButton(
                      text: 'Open in the browser',
                      onPressed: () {
                        if (state.singleArticle.link != null &&
                            state.singleArticle.link?.isNotEmpty == true) {
                          openInBrowser(state.singleArticle.link ?? '');
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 40.h),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
