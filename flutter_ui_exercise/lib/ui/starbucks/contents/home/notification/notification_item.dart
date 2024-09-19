import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_exercise/ui/starbucks/contents/home/notification/notification_icon_type.dart';

extension on NotificationIconType {
  Icon get iconData {
    switch (this) {
      case NotificationIconType.star:
        return const Icon(
          Icons.star_outline,
          size: 30,
        );
      case NotificationIconType.coffee:
        return const Icon(
          Icons.coffee_outlined,
          size: 30,
        );
    }
  }
}

class NotificationSubItem extends StatelessWidget {
  NotificationIconType notiIcon;
  String body;
  String date;

  NotificationSubItem({
    super.key,
    required this.notiIcon,
    required this.body,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            notiIcon.iconData,
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  body,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(
              width: 50,
            ),
          ],
        ),
      ],
    );
  }
}

class NotificationItem extends StatelessWidget {
  NotificationIconType notiIcon;
  String body;
  String date;
  bool isExpanded;

  NotificationItem({
    super.key,
    required this.notiIcon,
    required this.body,
    required this.date,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            notiIcon.iconData,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  body,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Icon(
              isExpanded
                  ? CupertinoIcons.chevron_right
                  : CupertinoIcons.chevron_down,
              color: const Color.fromARGB(255, 117, 116, 116),
              size: 24,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        if (isExpanded) ...{
          Container(
            height: 75,
            color: const Color.fromARGB(255, 239, 236, 236),
            width: MediaQuery.sizeOf(context).width,
            child: NotificationSubItem(
              notiIcon: NotificationIconType.coffee,
              body: '8번째 메뉴로 준비중입니다. (A-32)',
              date: '2021.02.25 13:59:33',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        }
      ],
    );
  }
}
