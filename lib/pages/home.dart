import 'package:flutter/material.dart';
import 'package:gundam_apps/widgets/gundam_card.dart';
import '../theme.dart';
//import '../widgets/gundam_card.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hitam,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: edge),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Best SD Gundam',
                style: txtPutih.copyWith(fontSize: 24),
              ),
            ),
            SizedBox(height: 2),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Perfect Choice!',
                style: txtAbu.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Popular',
                style: regulerTxt.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GundamCard(),
            ),
          ],
        ),
      ),
    );
  }
}
