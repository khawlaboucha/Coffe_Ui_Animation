

import 'package:coffe_ui_animation/coffe_consept/coffe_consepts_list.dart';
import 'package:flutter/material.dart';

import 'coffe.dart';

class SplashScreenCoffe extends StatelessWidget {
  const SplashScreenCoffe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body:GestureDetector(
        onVerticalDragUpdate: (details){
          if(details.primaryDelta! < -20){
            Navigator.of(context).push(
              PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds:650),
                  pageBuilder:(context ,animation , _){
                    return FadeTransition(opacity: animation,
                    child: CoffeConseptList(),);
                  } ),
            );

          }

        },
        child: Stack(
          children: [
            SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0XFFA89276),
                      Colors.white,
                    ],
                  )
                )
              ),
            ),
            Positioned(
                height: size.height*0.4,
                left: 0,
                right: 0,
                top: size.height*0.17,
                child: Hero(
                tag:'7',
                 child: Image.asset(coffees[10].image),
            )),
            Positioned(
                height: size.height*0.7,
                left: 0,
                right: 0,
                bottom: 0,
                child: Hero(
                  tag:'8',
                  child: Image.asset(coffees[7].image,fit: BoxFit.cover),
                )),
            Positioned(
                height: size.height,
                left: 0,
                right: 0,
                bottom: -size.height*0.8,
                child: Hero(
                  tag:'9',
                  child: Image.asset(coffees[8].image,fit: BoxFit.cover,),
                )),
            Positioned(
              height: 140,
              left: 0,
              right: 0,
              bottom: size.height*0.25,
              child: Image.asset('assets/coffee_consepts/logo.png'),)

          ],
        ),
      ) ,
    );
  }
}
