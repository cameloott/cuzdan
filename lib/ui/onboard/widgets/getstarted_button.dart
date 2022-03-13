import 'package:flutter/material.dart';

import '../../../core/init/theme/color_scheme_dark.dart';

//TODO custom button tasarlanması daha iyi olur
//TODO statik veriler dinamiğe çekilmei

class GetStartedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: Size(125, 45),
            side: BorderSide(
              color: ColorSchemeDark.instance!.blue,
            ),
            primary: Colors.white,
          ),
          onPressed: () {},
          child: Text('giriş yap'),
        ),
        OutlinedButton(
          child: Text('kayıt ol'),
          style: OutlinedButton.styleFrom(
            minimumSize: Size(125, 45),
            primary: Colors.white,
            backgroundColor: ColorSchemeDark.instance!.blue,
          ),
          onPressed: () {
            print('Pressed');
          },
        )
      ],
    );
  }
}
