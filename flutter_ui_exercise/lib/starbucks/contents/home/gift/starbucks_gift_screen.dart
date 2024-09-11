import 'package:flutter/material.dart';

class StarbucksGiftScreen extends StatefulWidget {
  const StarbucksGiftScreen({super.key});

  @override
  State<StatefulWidget> createState() => _StarbucksGiftScreenState();
}

class _StarbucksGiftScreenState extends State<StarbucksGiftScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabController.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'e-Gift Card',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: const [
            Icon(
              Icons.info_outline,
              color: Colors.grey,
            ),
          ],
        ),
        body: ListView(
          children: [
            TabBar(
              controller: _tabController,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2.5,
                ),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(
                  child: Text(
                    '선물하기',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
                Tab(
                  child: Text(
                    '선물내역',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height * 0.30,
                      child: PageView(
                        controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: ((int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        }),
                        children: [
                          Image.asset(
                            'images/starbucks/card_big.png',
                            fit: BoxFit.fill,
                          ),
                          Image.asset(
                            'images/starbucks/card_big.png',
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          2,
                          (index) => _buildIndicator(index),
                        ),
                      ),
                    ),
                  ],
                ),
                ImageScrollView(
                  title: '시즌',
                  images: [
                    Image.asset("images/starbucks/card_small_1-1.png"),
                    Image.asset("images/starbucks/card_small_1-2.png"),
                    Image.asset("images/starbucks/card_small_1-3.png"),
                    Image.asset("images/starbucks/card_small_2-1.png"),
                    Image.asset("images/starbucks/card_small_2-2.png"),
                    Image.asset("images/starbucks/card_small_2-3.png"),
                  ],
                ),
                ImageScrollView(
                  title: 'Coffee',
                  images: [
                    Image.asset("images/starbucks/card_small_2-1.png"),
                    Image.asset("images/starbucks/card_small_2-2.png"),
                    Image.asset("images/starbucks/card_small_2-3.png"),
                    Image.asset("images/starbucks/card_small_1-1.png"),
                    Image.asset("images/starbucks/card_small_1-2.png"),
                    Image.asset("images/starbucks/card_small_1-3.png"),
                  ],
                ),
                ImageScrollView(
                  title: '축하',
                  images: [
                    Image.asset("images/starbucks/card_small_1-1.png"),
                    Image.asset("images/starbucks/card_small_2-1.png"),
                    Image.asset("images/starbucks/card_small_1-2.png"),
                    Image.asset("images/starbucks/card_small_2-2.png"),
                    Image.asset("images/starbucks/card_small_1-3.png"),
                    Image.asset("images/starbucks/card_small_2-3.png"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicator(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index
            ? const Color.fromARGB(255, 138, 93, 51)
            : Colors.grey,
      ),
    );
  }
}

class ImageScrollView extends StatelessWidget {
  ImageScrollView({super.key, required this.title, required this.images});

  String title;
  List<Image> images;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: title == 'Coffee'
          ? Colors.white
          : const Color.fromARGB(255, 236, 231, 231),
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Row(
                  children: [
                    Text(
                      '더보기',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 112, 110, 110),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Color.fromARGB(255, 112, 110, 110),
                      size: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                images.length,
                (int index) {
                  return Container(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    height: 80,
                    width: 120,
                    child: images[index],
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
