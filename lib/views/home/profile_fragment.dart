import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              heading(),
              body()
            ],
          )
        )
      )
    );
  }

  Widget heading() {
    return Text(
      'About',
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
      style: GoogleFonts.sourceSansPro(
        decoration: TextDecoration.none,
        height: 2,
        fontSize: 26.0,
        fontWeight: FontWeight.w600,
        color: Color(0xff404040)
      )
    );
  }

  Widget body() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50.0),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              alignment: Alignment.center,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Color(0xffd5d5d5),
                  borderRadius: BorderRadius.circular(100.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffdedede),
                      offset: Offset(0, 2.0),
                      blurRadius: 8.0
                    )
                  ],
                  image: DecorationImage(
                    image: AssetImage('images/latif.jpg'),
                    fit: BoxFit.cover
                  )
                )
              )
            ),
            SizedBox(height: 50.0),
            Container(
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 40.0,
                bottom: 40.0
              ),
              decoration: BoxDecoration(
                color: Color(0xff727070),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffdedede),
                    offset: Offset(0, -5.0),
                    blurRadius: 8.0
                  )
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  itemProfile('Nama', 'Abdul Latif'),
                  itemProfile('NIM', '20190801035'),
                  itemProfile('Alamat', 'Cisoka'),
                  itemProfile('Kampus', 'Universitas EsaUnggul'),
                ],
              )
            )
          ]
        )
      )
    );
  }

  Widget itemProfile(String label, String body) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      padding: EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
        left: 14.0,
        right: 14.0
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            textDirection: TextDirection.ltr,
            style: GoogleFonts.roboto(
              decoration: TextDecoration.none,
              fontSize: 16.0,
              color: Color(0xffa2a2a2)
            ),
          ),
          SizedBox(height: 4),
          Text(
            body,
            textDirection: TextDirection.ltr,
            style: GoogleFonts.roboto(
              decoration: TextDecoration.none,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: Color(0xff2c2c2c)
            ),
          )
        ]
      )
    );
  }
}
