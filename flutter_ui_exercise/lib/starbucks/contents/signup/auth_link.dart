import 'package:flutter/material.dart';

enum AuthLinkType {
  phone,
  mobileCarrier,
  personalInfo,
  uniqueId;

  String get description {
    switch (this) {
      case AuthLinkType.phone:
        return "휴대폰 본인 인증 서비스 이용약관 동의 (필수)";
      case AuthLinkType.mobileCarrier:
        return "휴대폰 통신사 이용약관 동의 (필수)";
      case AuthLinkType.personalInfo:
        return "개인정보 제공 및 이용 동의 (필수)";
      case AuthLinkType.uniqueId:
        return "고유식별정보 처리 (필수)";
    }
  }
}

class AuthLink extends StatelessWidget {
  AuthLink({super.key, required this.type});
  AuthLinkType type;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          type.description,
          style: const TextStyle(
            color: Color.fromARGB(255, 106, 106, 106),
            fontWeight: FontWeight.w500,
          ),
        ),
        const Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 16,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class AuthLinks extends StatelessWidget {
  const AuthLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: AuthLinkType.values.length,
      itemBuilder: (ctx, idx) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 1, top: 4),
          child: AuthLink(type: AuthLinkType.values[idx]),
        );
      },
    );
  }
}
