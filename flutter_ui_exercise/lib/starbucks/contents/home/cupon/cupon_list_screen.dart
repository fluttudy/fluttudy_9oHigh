import 'package:flutter/material.dart';
import 'package:flutter_ui_exercise/starbucks/contents/home/cupon/cupon_registration_screen.dart';

class CuponListScreen extends StatefulWidget {
  const CuponListScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CuponListScreenState();
}

class _CuponListScreenState extends State<CuponListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Color.fromARGB(255, 133, 131, 131),
            ),
          ),
          title: const Text(
            'Cupon',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const CuponRegistrationScreen();
                    },
                  ),
                );
              },
              child: const Icon(
                Icons.add,
                color: Colors.grey,
                size: 30,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.info_outline,
                color: Colors.grey,
                size: 26,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Colors.grey,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(color: Colors.green),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 0,
                labelColor: Colors.white,
                unselectedLabelColor: const Color.fromARGB(255, 95, 95, 95),
                tabs: const [
                  Tab(
                    child: Text('사용 가능한 쿠폰'),
                  ),
                  Tab(
                    child: Text('쿠폰 히스토리'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 12),
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '영수증 쿠폰 또는 MMS쿠폰을\n우측 상단 +버튼을 눌러 등록해 보세요.',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CuponHistory(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CuponHistory extends StatelessWidget {
  const CuponHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      color: const Color.fromARGB(255, 244, 240, 238),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 12,
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.bookmark_sharp,
                color: Colors.grey,
                size: 44,
              ),
              Text(
                '쿠폰 사용',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '2020 크리스마스 e-프리퀀시 완성 쿠폰',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                '2020.12.31 까지 | 2020.12.23 사용',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 34,
                width: 165,
                child: FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 110, 89, 82),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      )),
                  child: const Text(
                    '영수증 보기',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
