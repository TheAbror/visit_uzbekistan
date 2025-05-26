import 'package:visit_uzbekistan/widget_imports.dart';

class SingleCarPage extends StatefulWidget {
  final int id;

  const SingleCarPage({
    super.key,
    required this.id,
  });

  @override
  State<SingleCarPage> createState() => _SingleCarPageState();
}

class _SingleCarPageState extends State<SingleCarPage> {
  final List<String> images = [
    'https://bydzone.uz/wp-content/uploads/2024/02/byd-han-exterior-03-20-min.png',
    'https://bydzone.uz/wp-content/uploads/2024/02/byd-han-exterior-15-13-min.png',
    'https://bydzone.uz/wp-content/uploads/2024/02/byd-han-exterior-15-14-min.png',
    'https://bydzone.uz/wp-content/uploads/2024/02/byd-han-exterior-15-15-min.png',
    'https://bydzone.uz/wp-content/uploads/2024/02/byd-han-interior-04-21-min.png',
  ];

// Dummy data
  final carTitle = 'BYD Champion Hybrid';
  final carDescription =
      'BYD Champion Hybrid — это не просто автомобиль. Это новый уровень экологичного вождения. Самое главное преимущество BYD Champion Hybrid — это его высокоэффективная гибридная система, которая сочетает в себе мощный электрический двигатель и бензиновый мотор для максимальной экономии топлива и плавного хода.';
  final rentalTerms = [
    '1-14 дней: 1.200.000 UZS (2024 г.в.)',
    '14-30 дней: 1.100.000 UZS (2024 г.в.)'
  ];
  final specs = {
    'Объём турбо двигателя': '1,5 л (180 л.с.)',
    'Тип гибридной системы': 'Плагин-гибрид (PHEV)',
    'Расход топлива': '4,5 л / 100 км',
    'Электрический пробег': 'до 60 км',
    'Цвета': 'Белый, синий, чёрный',
    'Кондиционер': 'Есть',
    'Коробка передач': 'Автомат',
    'Привод': 'Передний привод',
    'Страхование': 'КАСКО, ОСАГО',
    'Багажник': '500 л',
    'Сидений': '5',
    'Мультимедиа': '10,1" сенсорный экран, Android Auto, Apple CarPlay',
    'Камера заднего вида': 'Есть',
    'Депозит': '3.000.000 UZS',
  };

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
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
        title: const Text('Car Details'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 250,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      images[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              // Index indicator
              Positioned(
                right: 16,
                bottom: 16,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${_currentPage + 1} / ${images.length}',
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
                  carTitle,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 12.h),
                // Description
                Text(
                  carDescription,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey[800],
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 16.h),
                // Rental terms
                Text(
                  'Аренда:',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                ...rentalTerms.map((term) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      child: Text(
                        term,
                        style: TextStyle(fontSize: 15.sp, color: Colors.black),
                      ),
                    )),
                SizedBox(height: 16.h),
                // Specs
                Text(
                  'Характеристики:',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8.h),
                ...specs.entries.map(
                  (entry) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check_circle_outline,
                            color: Colors.green, size: 20.w),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.black87),
                              children: [
                                TextSpan(
                                    text: '${entry.key}: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black)),
                                TextSpan(text: entry.value),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                // Call to action

                ActionButton(
                  text: 'Book this car',
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
