import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_exercise/starbucks/contents/home/notification/notification_icon_type.dart';
import 'package:flutter_ui_exercise/starbucks/contents/home/notification/notification_item.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<StatefulWidget> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationItem> items = [
    NotificationItem(
      notiIcon: NotificationIconType.coffee,
      body: '메뉴가 모두 준비되었어요.(A-24)\n픽업대에서 메뉴를 픽업해주세요!\n매장 방문시 마스크를 꼭 착용해주세요.',
      date: '2021.03.05 17:44:41',
      isExpanded: false,
    ),
    NotificationItem(
      notiIcon: NotificationIconType.coffee,
      body: '메뉴가 모두 준비되었어요.(A-24)\n픽업대에서 메뉴를 픽업해주세요!\n매장 방문시 마스크를 꼭 착용해주세요.',
      date: '2021.03.05 17:44:41',
      isExpanded: false,
    ),
    NotificationItem(
      notiIcon: NotificationIconType.star,
      body: '지금 마이 스타벅스 리뷰에 참여해보세요!',
      date: '2021.03.05 17:44:41',
      isExpanded: false,
    ),
    NotificationItem(
      notiIcon: NotificationIconType.coffee,
      body: '메뉴가 모두 준비되었어요.(A-24)\n픽업대에서 메뉴를 픽업해주세요!\n매장 방문시 마스크를 꼭 착용해주세요.',
      date: '2021.03.05 17:44:41',
      isExpanded: false,
    ),
    NotificationItem(
      notiIcon: NotificationIconType.coffee,
      body: '메뉴가 모두 준비되었어요.(A-24)\n픽업대에서 메뉴를 픽업해주세요!\n매장 방문시 마스크를 꼭 착용해주세요.',
      date: '2021.03.05 17:44:41',
      isExpanded: false,
    ),
    NotificationItem(
      notiIcon: NotificationIconType.coffee,
      body: '메뉴가 모두 준비되었어요.(A-24)\n픽업대에서 메뉴를 픽업해주세요!\n매장 방문시 마스크를 꼭 착용해주세요.',
      date: '2021.03.05 17:44:41',
      isExpanded: false,
    ),
    NotificationItem(
      notiIcon: NotificationIconType.coffee,
      body: '메뉴가 모두 준비되었어요.(A-24)\n픽업대에서 메뉴를 픽업해주세요!\n매장 방문시 마스크를 꼭 착용해주세요.',
      date: '2021.03.05 17:44:41',
      isExpanded: false,
    ),
    NotificationItem(
      notiIcon: NotificationIconType.coffee,
      body: '메뉴가 모두 준비되었어요.(A-24)\n픽업대에서 메뉴를 픽업해주세요!\n매장 방문시 마스크를 꼭 착용해주세요.',
      date: '2021.03.05 17:44:41',
      isExpanded: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '알림',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
        actions: [
          IconButton(
            onPressed: () {
              _showDialog(context);
              // setState(() {
              //   items = [];
              // });
            },
            icon: const Icon(
              CupertinoIcons.trash,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: DropdownButton(
                isExpanded: true,
                value: '전체',
                items: [
                  '전체',
                  '주문',
                ]
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  print(value);
                },
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.zero,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      item.isExpanded = !item.isExpanded;
                    });
                  },
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: NotificationItem(
                      notiIcon: item.notiIcon,
                      body: item.body,
                      date: item.date,
                      isExpanded: item.isExpanded,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: MediaQuery.sizeOf(context).height * 0.2,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text(
                  '알림함의 모든 메세지를 삭제하시겠어요?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(
                          color: Colors.green,
                          width: 0.75,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        '아니오',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.green,
                        side: const BorderSide(
                          color: Colors.green,
                          width: 0.75,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          items = [];
                        });
                      },
                      child: const Text(
                        '전체 삭제',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
