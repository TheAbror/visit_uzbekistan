import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

// class ToursTab extends StatefulWidget {
//   const ToursTab({super.key});

//   @override
//   State<ToursTab> createState() => _ToursTabState();
// }

// class _ToursTabState extends State<ToursTab> {
//   late final WebViewController _controller;
//   double _progress = 0;

//   @override
//   void initState() {
//     super.initState();

//     _controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             debugPrint('WebView is loading (progress : $progress%)');
//             setState(() {
//               _progress = progress / 100;
//             });
//           },
//           onPageStarted: (String url) {
//             debugPrint('Page started loading: $url');
//           },
//           onPageFinished: (String url) {
//             debugPrint('Page finished loading: $url');
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse('https://khivatravels.uz/tours/yurt-camp-tour'));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WebViewWidget(controller: _controller);

//     // SizedBox(
//     //   height: 400.h,
//     //   width: double.infinity,
//     //   child: Column(
//     //     children: [
//     //       (_progress < 1)
//     //           ? LinearProgressIndicator(
//     //               value: _progress,
//     //               backgroundColor: Colors.transparent,
//     //               valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
//     //             )
//     //           : SizedBox.shrink(),
//     //       WebViewWidget(controller: _controller),
//     //     ],
//     //   ),
//     // );
//   }
// }

class ToursTab extends StatelessWidget {
  const ToursTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(
      builder: (context, state) {
        if (state.response.tours.isEmpty) {
          return Padding(
            padding: EdgeInsets.only(bottom: 50.h),
            child: Center(
              child: Text('No tours found'),
            ),
          );
        }

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.h,
            crossAxisSpacing: 8.h,
            childAspectRatio: 0.85,
          ),
          itemCount: state.response.tours.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final singleItem = state.response.tours[index];

            return GridViewItem(item: singleItem);
          },
        );
      },
    );
  }
}
