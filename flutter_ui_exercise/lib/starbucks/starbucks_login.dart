import 'package:flutter/material.dart';

class StartbucksApp extends StatelessWidget {
  const StartbucksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            '로그인',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        body: const StarbucksLogin(),
      ),
    );
  }
}

class StarbucksLogin extends StatelessWidget {
  const StarbucksLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          margin: const EdgeInsets.only(left: 18, top: 44),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/starbucks/starbucks_logo.png',
                width: 75,
                height: 75,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                '안녕하세요.\n스타벅스입니다.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                '회원 서비스 이용을 위해 로그인 해주세요.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 75,
        ),
        const StarbucksLoginTextFields(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                width: MediaQuery.sizeOf(context).width * 0.9,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      '로그인하기',
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
    );
  }
}

class StarbucksLoginTextFields extends StatefulWidget {
  const StarbucksLoginTextFields({super.key});

  @override
  State<StatefulWidget> createState() => _StarbucksLoginTextFieldsState();
}

class _StarbucksLoginTextFieldsState extends State<StarbucksLoginTextFields> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.9,
          child: TextField(
            controller: idController,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            decoration: const InputDecoration(
              hintText: '아이디',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.9,
          child: TextField(
            controller: passwordController,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            decoration: const InputDecoration(
              hintText: '비밀번호',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: ButtonStyle(
                overlayColor: WidgetStateColor.resolveWith(
                    (states) => Colors.transparent),
              ),
              onPressed: () {},
              child: const Text(
                '아이디 찾기',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              width: 1,
              height: 12,
              child: Container(
                color: Colors.grey,
              ),
            ),
            TextButton(
              style: ButtonStyle(
                overlayColor: WidgetStateColor.resolveWith(
                    (states) => Colors.transparent),
              ),
              onPressed: () {},
              child: const Text(
                '비밀번호 찾기',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              width: 1,
              height: 12,
              child: Container(
                color: Colors.grey,
              ),
            ),
            TextButton(
              style: ButtonStyle(
                overlayColor: WidgetStateColor.resolveWith(
                    (states) => Colors.transparent),
              ),
              onPressed: () {},
              child: const Text(
                '회원가입 찾기',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
