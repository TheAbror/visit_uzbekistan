import 'package:visit_uzbekistan/widget_imports.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final tabs = [
    SizedBox(),
    SizedBox(),
    SizedBox(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootBloc, RootState>(
      builder: (context, state) {
        return Scaffold(
          // backgroundColor: Colors.black,
          body: tabs[state.tabIndex],
          extendBody: true,
          bottomNavigationBar: RootPageBottomAppBar(
            tabIndex: state.tabIndex,
          ),
        );
      },
    );
  }
}

class RootPageBottomAppBar extends StatelessWidget {
  final int tabIndex;

  const RootPageBottomAppBar({
    super.key,
    required this.tabIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      margin: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 30.h),
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(50.r),
        boxShadow: [
          BoxShadow(
            color: Color(0XFF323140).withOpacity(0.15),
            offset: Offset(0, 8),
            blurRadius: 25,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.home,
              size: 26.h,
              color: tabIndex == 0 ? AppColors.float : Colors.black,
            ),
            onPressed: () {
              context.read<RootBloc>().changeTab(0);
            },
          ),
          Spacer(flex: 2),
          IconButton(
            icon: Icon(
              Icons.favorite,
              size: 26.h,
              color: tabIndex == 1 ? AppColors.float : Colors.black,
            ),
            onPressed: () {
              context.read<RootBloc>().changeTab(1);
            },
          ),
          Spacer(flex: 2),
          IconButton(
            icon: Icon(
              Icons.travel_explore,
              size: 26.h,
              color: tabIndex == 2 ? AppColors.float : Colors.black,
            ),
            onPressed: () {
              context.read<RootBloc>().changeTab(2);
            },
          ),
          Spacer(flex: 2),
          IconButton(
            icon: Icon(
              Icons.person,
              size: 26.h,
              color: tabIndex == 3 ? AppColors.float : Colors.black,
            ),
            onPressed: () {
              context.read<RootBloc>().changeTab(3);
            },
          ),
          Spacer(),
        ],
      ),
    );
    // BottomAppBar(
    //   padding: const EdgeInsets.symmetric(horizontal: 10),
    //   height: 55.h,
    //   color: Colors.cyan.shade400,
    //   notchMargin: 5,

    //   child: Row(
    //     mainAxisSize: MainAxisSize.max,
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: <Widget>[
    //       Spacer(),
    //       IconButton(
    //         icon: const Icon(Icons.home),
    //         onPressed: () {
    //           context.read<RootBloc>().changeTab(0);
    //         },
    //       ),
    //       Spacer(flex: 2),
    //       IconButton(
    //         icon: const Icon(Icons.favorite),
    //         onPressed: () {
    //           context.read<RootBloc>().changeTab(1);
    //         },
    //       ),
    //       Spacer(flex: 2),
    //       IconButton(
    //         icon: Icon(
    //           Icons.travel_explore,
    //           size: 26.h,
    //         ),
    //         onPressed: () {
    //           context.read<RootBloc>().changeTab(2);
    //         },
    //       ),
    //       Spacer(flex: 2),
    //       IconButton(
    //         icon: const Icon(Icons.person),
    //         onPressed: () {
    //           context.read<RootBloc>().changeTab(3);
    //         },
    //       ),
    //       Spacer(),
    //     ],
    //   ),
    //   // selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
    //   //     unselectedItemColor: const Color.fromARGB(255, 146, 138, 138),
    //   //     selectedFontSize: 0,
    //   // currentIndex: _selectedIndex,
    //   //     backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    //   //     onTap: onTapImplemented,
    // );
  }
}
