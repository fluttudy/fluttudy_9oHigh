import 'package:flutter/material.dart';

class NavIndicator extends StatelessWidget {
  NavIndicator({super.key, required this.selectedIdx});
  int selectedIdx;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleNumber(
          number: '1',
          isSelected: selectedIdx.toString() == '1',
        ),
        Container(
          width: 8,
          height: 1,
          color: Colors.grey,
        ),
        CircleNumber(
          number: '2',
          isSelected: selectedIdx.toString() == '2',
        ),
        Container(
          width: 8,
          height: 1,
          color: Colors.grey,
        ),
        CircleNumber(
          number: '3',
          isSelected: selectedIdx.toString() == '3',
        ),
        Container(
          width: 8,
          height: 1,
          color: Colors.grey,
        ),
        CircleNumber(
          number: '4',
          isSelected: selectedIdx.toString() == '4',
        ),
      ],
    );
  }
}

class CircleNumber extends StatelessWidget {
  CircleNumber({super.key, required this.number, required this.isSelected});
  String number;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: const Color.fromARGB(255, 135, 134, 134), width: 0.1),
        color: isSelected ? Colors.black : Colors.white,
      ),
      child: Text(
        number,
        style: TextStyle(
          fontSize: 12,
          color: isSelected ? Colors.white : Colors.grey,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
