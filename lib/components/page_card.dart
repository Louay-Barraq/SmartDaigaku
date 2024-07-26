import 'package:flutter/material.dart';

class CustomPageCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String explanation;
  final Widget page;

  CustomPageCard({
    required this.icon,
    required this.title,
    required this.explanation,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white, width: 1.5),
          color: Color(0xFF52556F),
          image: DecorationImage(
            image: AssetImage("assets/images/page_card_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(icon, color: Colors.white, size: 45),
                  SizedBox(height: 5),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 7),
                  Expanded(
                    child: Text(
                      explanation,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_forward,
                    color: Color(0xFF52556F),
                    size: 32,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
