import 'package:flutter/material.dart';

class CustomImageContainer extends StatelessWidget {
  final String imageUrl;
  final String imageName;

  const CustomImageContainer({
    super.key,
    required this.imageUrl,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff29A0E3), width: 2),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(19.0),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                    ))),
            Text(imageName,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                )),
          ],
        ),
      ),
    );
  }
}
