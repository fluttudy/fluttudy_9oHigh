import 'package:flutter/material.dart';
import 'package:flutter_ui_exercise/ui/starbucks/contents/signup/common/nav_indicator.dart';

class StarbucksSignupAccount extends StatefulWidget {
  const StarbucksSignupAccount({super.key});

  @override
  State<StatefulWidget> createState() => StarbucksSignupAccountState();
}

class StarbucksSignupAccountState extends State<StarbucksSignupAccount> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  bool _isShowingIdCheckMark = false;
  bool _isShowingPasswordCheckMark = false;
  bool _isShowingRepeatPasswordCheckMark = false;

  bool _isShowingPasswordVisiblityMark = false;
  bool _isShowingRepeatPasswordVisiblityMark = false;

  bool _isSecuredPassword = true;
  bool _isSecuredRepeatPassword = true;

  bool _isAllChecked = false;

  @override
  Widget build(BuildContext context) {
    _isShowingRepeatPasswordCheckMark =
        _passwordController.text == _repeatPasswordController.text &&
            _passwordController.text.length > 10;
    _isAllChecked = _isShowingIdCheckMark &&
        _isShowingPasswordCheckMark &&
        _isShowingRepeatPasswordCheckMark;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            NavIndicator(
              selectedIdx: 2,
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          color: Colors.grey,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          margin: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '아이디와 비밀번호를\n입력해 주세요.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              SizedBox(
                child: Stack(
                  children: [
                    TextField(
                      controller: _idController,
                      maxLength: 14,
                      decoration: const InputDecoration(
                        counterText: '',
                        hintText: '아이디 (4~13자리 이내)',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 18, 122, 21),
                            width: 1,
                          ),
                        ),
                      ),
                      onChanged: (id) {
                        setState(() {
                          if (id.length > 4) {
                            _isShowingIdCheckMark = true;
                          } else {
                            _isShowingIdCheckMark = false;
                          }
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.check,
                            color: Colors.transparent,
                            size: 24,
                          ),
                        ),
                        Icon(
                          Icons.check,
                          color: _isShowingIdCheckMark
                              ? const Color.fromARGB(255, 18, 122, 21)
                              : Colors.transparent,
                          size: 24,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                child: Stack(
                  children: [
                    TextField(
                      controller: _passwordController,
                      maxLength: 21,
                      obscureText: _isSecuredPassword,
                      autocorrect: false,
                      enableSuggestions: false,
                      decoration: const InputDecoration(
                        counterText: '',
                        hintText: '비밀번호 (10~20자리 이내)',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 18, 122, 21),
                            width: 1,
                          ),
                        ),
                      ),
                      onChanged: (password) {
                        setState(() {
                          if (password.isNotEmpty) {
                            _isShowingPasswordVisiblityMark = true;
                          } else {
                            _isShowingPasswordVisiblityMark = false;
                          }
                          if (password.length > 10) {
                            _isShowingPasswordCheckMark = true;
                          } else {
                            _isShowingPasswordCheckMark = false;
                          }
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (_isShowingPasswordVisiblityMark) {
                              setState(() {
                                _isSecuredPassword = !_isSecuredPassword;
                              });
                            }
                          },
                          icon: Icon(
                            _isSecuredPassword
                                ? Icons.visibility
                                : Icons.visibility_off_outlined,
                            color: _isShowingPasswordVisiblityMark
                                ? Colors.grey
                                : Colors.transparent,
                            size: 24,
                          ),
                        ),
                        Icon(
                          Icons.check,
                          color: _isShowingPasswordCheckMark
                              ? const Color.fromARGB(255, 18, 122, 21)
                              : Colors.transparent,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                child: Stack(
                  children: [
                    TextField(
                      controller: _repeatPasswordController,
                      maxLength: 21,
                      obscureText: _isSecuredRepeatPassword,
                      autocorrect: false,
                      enableSuggestions: false,
                      decoration: const InputDecoration(
                        counterText: '',
                        hintText: '비밀번호 확인',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 18, 122, 21),
                            width: 1,
                          ),
                        ),
                      ),
                      onChanged: (repeat) {
                        setState(() {
                          if (repeat.isNotEmpty) {
                            _isShowingRepeatPasswordVisiblityMark = true;
                          } else {
                            _isShowingRepeatPasswordVisiblityMark = false;
                          }
                          if (repeat.length > 10 &&
                              _passwordController.text ==
                                  _repeatPasswordController.text) {
                            _isShowingRepeatPasswordCheckMark = true;
                          } else {
                            _isShowingRepeatPasswordCheckMark = false;
                          }
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (_isShowingRepeatPasswordVisiblityMark) {
                              setState(() {
                                _isSecuredRepeatPassword =
                                    !_isSecuredRepeatPassword;
                              });
                            }
                          },
                          icon: Icon(
                            _isSecuredRepeatPassword
                                ? Icons.visibility
                                : Icons.visibility_off_outlined,
                            color: _isShowingRepeatPasswordVisiblityMark
                                ? Colors.grey
                                : Colors.transparent,
                            size: 24,
                          ),
                        ),
                        Icon(
                          Icons.check,
                          color: _isShowingRepeatPasswordCheckMark
                              ? const Color.fromARGB(255, 18, 122, 21)
                              : Colors.transparent,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      decoration: BoxDecoration(
                        color: _isAllChecked ? Colors.green : Colors.grey,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                      ),
                      child: TextButton(
                          onPressed: () {},
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
      ),
    );
  }
}
