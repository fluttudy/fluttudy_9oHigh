import 'package:flutter/material.dart';
import 'package:flutter_ui_exercise/ui/starbucks/contents/signup/account/starbucks_signup_account_screen.dart';
import 'package:flutter_ui_exercise/ui/starbucks/contents/signup/auth/auth_link.dart';
import 'package:flutter_ui_exercise/ui/starbucks/contents/signup/common/nav_indicator.dart';

class StarbucksSignupAuth extends StatefulWidget {
  const StarbucksSignupAuth({super.key});

  @override
  State<StatefulWidget> createState() => StarbucksSignupAuthState();
}

class StarbucksSignupAuthState extends State<StarbucksSignupAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            NavIndicator(
              selectedIdx: 1,
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '본인확인을 위해\n인증을 진행해 주세요.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Checkbox(
                    value: false,
                    onChanged: null,
                    checkColor: Colors.green,
                    shape: CircleBorder(
                      side: BorderSide(width: 0.1),
                    ),
                  ),
                ),
                Text(
                  '본인 인증 서비스 약관 전체동의',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.1575,
              child: const AuthLinks(),
            ),
            Container(
              clipBehavior: Clip.none,
              width: MediaQuery.sizeOf(context).width,
              height: 1,
              color: const Color.fromARGB(255, 192, 191, 191),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: const TextField(
                decoration: InputDecoration(
                  hintText: '이름',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 192, 191, 191),
                    fontSize: 18,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 192, 191, 191), width: 1.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: '생년월일 6자리',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 192, 191, 191),
                        fontSize: 18,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  width: 6,
                  height: 2,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 1,
              color: const Color.fromARGB(255, 192, 191, 191),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: 'SKT',
                    items: ['SKT', 'KT', 'LGU+']
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) {
                      print(value);
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Color.fromARGB(255, 192, 191, 191),
                    ),
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '휴대폰 번호',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 192, 191, 191),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      '인증요청',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ],
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 1,
              color: const Color.fromARGB(255, 192, 191, 191),
            ),
            const SizedBox(
              height: 24,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Icon(
                    Icons.circle,
                    size: 6,
                    color: Color.fromARGB(255, 69, 69, 69),
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Flexible(
                  child: Text(
                    '타인의 개인정보를 도용하여 가입한 경우, 서비스 이용 제한 및 법적 제재를 받으실 수 있습니다.',
                    style: TextStyle(
                      color: Color.fromARGB(255, 69, 69, 69),
                    ),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 218, 215, 215),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const StarbucksSignupAccount()));
                        },
                        child: const Text(
                          '다음',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
