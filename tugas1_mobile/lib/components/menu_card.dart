import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String title; 
  final String icon; 
  final Widget page; 

  const MenuCard({
    super.key,
    required this.title, 
    required this.icon,
    required this.page}); //constructor 

  @override
  Widget build(BuildContext context) { 
    return InkWell(onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page
        ),
      );
    },
    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: const BorderSide(
          color: Colors.black,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children:[
            Image.asset(icon),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.right
              ),
            ),
          ],
        ),
      ),
    ),//widget
    ); 
  } //method
} 