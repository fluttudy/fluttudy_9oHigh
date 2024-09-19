import 'package:flutter/material.dart';

class CuponRegistrationScreen extends StatefulWidget {
  const CuponRegistrationScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CuponRegistrationScreenState();
}

class _CuponRegistrationScreenState extends State<CuponRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 134, 133, 133),
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Cupon 등록',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        actions: const [
          Icon(
            Icons.info_outline,
            color: Colors.grey,
            size: 26,
          ),
          SizedBox(
            width: 8,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '영수증 쿠폰 또는 MMS 쿠폰 중 등록할 쿠폰을 선택해주세요.',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color.fromARGB(255, 193, 190, 190),
                            width: 1.25,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 168, 135, 123),
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(width: 8),
                  const Text('영수증 쿠폰'),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color.fromARGB(255, 193, 190, 190),
                            width: 1.25,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(width: 8),
                  const Text('MMS 쿠폰'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '영수증 쿠폰번호 17자리를 입력하세요.',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 44,
                    width: 60,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 1),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: const SizedBox(
                      height: 2,
                      width: 6,
                    ),
                  ),
                  const SizedBox(
                    height: 44,
                    width: 90,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 1),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: const SizedBox(
                      height: 2,
                      width: 6,
                    ),
                  ),
                  const SizedBox(
                    height: 44,
                    width: 60,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 1),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: const SizedBox(
                      height: 2,
                      width: 6,
                    ),
                  ),
                  const SizedBox(
                    height: 44,
                    width: 60,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '쿠폰 등록코드 8자리를 입력해주세요.',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: 48,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 48,
                width: MediaQuery.sizeOf(context).width,
                child: FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                      shape: const BeveledRectangleBorder(),
                      backgroundColor:
                          const Color.fromARGB(255, 210, 202, 202)),
                  child: const Text(
                    '바코드 인식하기',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color.fromARGB(255, 131, 130, 130),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                '· 쿠폰으로 등록한 영수증 쿠폰은 등록해지가 불가능하며, 등록 이후 기존의 실물 쿠폰은 더 이상 사용하실 수 없습니다.',
                style: TextStyle(
                  color: Color.fromARGB(255, 120, 120, 120),
                  fontSize: 11,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                '· 등록된 쿠폰은 해당 계정에 등록된 스타벅스카드 또는 쿠폰의 QR코드를 제시하여 사용하실 수 있습니다.',
                style: TextStyle(
                  color: Color.fromARGB(255, 120, 120, 120),
                  fontSize: 11,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                '· 쿠폰 및 실물 쿠폰은 상업적으로 이용할 수 없으며, 스타벅스에서 제공하는 쿠폰 선물하기 기능 외 방법으로 전달된 쿠폰 사용으로 인해 발생된 문제에 대해서는 스타벅스가 책임지지 않습니다.',
                style: TextStyle(
                  color: Color.fromARGB(255, 120, 120, 120),
                  fontSize: 11,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                '· 쿠폰이 발행된 원 거래가 취소되는 경우, 등록된 쿠폰도 즉시 회수됩니다.',
                style: TextStyle(
                  color: Color.fromARGB(255, 120, 120, 120),
                  fontSize: 11,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 48,
                      width: MediaQuery.sizeOf(context).width,
                      child: FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: const Text(
                          '등록하기',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
