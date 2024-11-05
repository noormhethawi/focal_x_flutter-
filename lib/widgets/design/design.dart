import 'package:flutter/material.dart';

class MyDesign extends StatelessWidget {
  const MyDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Transform(
                  transform: Matrix4.identity()
                    ..rotateZ(1.0)
                    ..translate(-5.0, -20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black,
                    ),
                    width: 7,
                    height: 2,
                    margin: EdgeInsets.only(right: 2),
                  )),
              SizedBox(
                height: 17,
              ),
              Transform(
                  transform: Matrix4.identity()
                    ..rotateZ(0.4)
                    ..translate(-8.0, -25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black,
                    ),
                    width: 17,
                    height: 2,
                    margin: EdgeInsets.only(right: 5),
                  )),
              SizedBox(
                height: 20,
              ),
              Transform(
                  transform: Matrix4.identity()
                    ..rotateZ(-0.2)
                    ..translate(10.0, -30.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black,
                    ),
                    width: 7,
                    height: 2,
                    margin: EdgeInsets.only(
                      right: 12,
                    ),
                  ))
            ],
          ),
        ),
        Container(
          child: Text(
            'Explore',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              fontFamily: 'Raleway',
              color: Color(0xFF2B2B2B),
            ),
          ),
        )
      ],
    );
  }
}
