
import 'package:coffe_ui_animation/coffe_consept/spalshScreen_Coffe.dart';
import 'package:flutter/material.dart';

import 'coffe.dart';
import 'coffe_consepts_details.dart';
const  _duration=Duration(milliseconds: 300);
const _initialPage=8.0;
class CoffeConseptList extends StatefulWidget {

   const CoffeConseptList({Key? key}) : super(key: key);

  @override
  State<CoffeConseptList> createState() => _CoffeConseptListState();
}

class _CoffeConseptListState extends State<CoffeConseptList> {
   final _pageCoffeController=PageController(
       viewportFraction: 0.35,
        initialPage: _initialPage.toInt());
   double _curentPage=_initialPage;
   final _pageTextController=PageController(initialPage: _initialPage.toInt());
   double _textPage=_initialPage;
   void _coffeScrollListiner(){
     setState(() {
       _curentPage=_pageCoffeController.page!;
     });
   }
   void _textScrollListiner(){
     _textPage=_curentPage;
   }
   @override
  void initState() {
     _pageCoffeController.addListener((_coffeScrollListiner));
     _pageTextController.addListener((_textScrollListiner));
    super.initState();
  }
  @override
  void dispose() {
    _pageCoffeController.removeListener((_coffeScrollListiner));
    _pageTextController.removeListener((_textScrollListiner));
    _pageCoffeController.dispose();
    _pageTextController.dispose();
    super.dispose();
  }
   @override
   Widget build(BuildContext context) {
     final size=MediaQuery.of(context).size;
     return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.transparent,
         elevation: 0,
         leading: IconButton(
           icon:Icon(Icons.arrow_back_ios_new),
           color: Colors.black,
           onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context)=>SplashScreenCoffe()));  },
         ),
         actions: [
           IconButton(onPressed:() {}, icon:Icon (Icons.shopping_bag_outlined),color: Colors.black,),


         ], shape:const RoundedRectangleBorder(
            borderRadius:BorderRadius.only(
              bottomLeft:Radius.circular(25),
              bottomRight: Radius.circular(25),
            )
       ),

       ),
       body: Stack(
         children: [
           Positioned(
               left: 20,
               right: 20,
               bottom: -size.height*0.22,
               height: size.height*0.3,
               child: DecoratedBox(decoration:BoxDecoration(
                 shape: BoxShape.circle,
                 boxShadow: [
                   BoxShadow(
                     color: Colors.brown,
                     blurRadius: 90,
                     offset: Offset.zero,
                     spreadRadius: 45,
                   )
                 ]
               ),)),

         Transform.scale(
           scale: 1.6,
           alignment: Alignment.bottomCenter,
           child: PageView.builder(
             controller:_pageCoffeController ,
              scrollDirection: Axis.vertical,
               itemCount: coffees.length+1,
               onPageChanged:(value){
               if(value< coffees.length){
                 _pageTextController.animateToPage(value, duration: _duration, curve:Curves.easeOut);
               }
               },
               itemBuilder: (context ,index){
               if(index==0){
                 return const SizedBox.shrink();
               }
             final coffe=coffees[index-1];
               final result=_curentPage-index+1;
               final value=-0.4* result + 1;
               final opasity=value.clamp(0.0, 1.0);
               return GestureDetector(
                 onTap: (){
                   Navigator.of(context).push(
                     PageRouteBuilder(
                         transitionDuration: const Duration(milliseconds:650),
                         pageBuilder:(context ,animation , _){
                           return FadeTransition(opacity: animation,
                             child: CoffeConseptsDetails(coffe:coffe));
                         } ),
                   );
                 },
                 child:
                   Padding(
                     padding: const EdgeInsets.only(bottom: 20),
                     child: Transform(
                       alignment: Alignment.bottomCenter,
                       transform: Matrix4.identity()..setEntry(3, 2,0.001)
                     ..translate(0.0,size.height/2.6*(1-value).abs())..scale(value),
                       child:Opacity(opacity: opasity,
                         child:Hero(
                           tag:'9',
                             child:Image.asset(coffe.image,fit: BoxFit.fitHeight,)),),
                      ),
                   ),

               );
             return Image.asset(coffe.image);
           }),
         ),
           Positioned(left: 0,             top: 0,
             right: 0,
             height: 100,
             child: TweenAnimationBuilder<double>(
                 tween: Tween(begin: 1.0,end: 0.0),
                 builder: (context,value,child){
                   return Transform.translate(offset: Offset(0.0, -100  * value),
                     child: child,);
                 },
                 duration:_duration,
               child: Column(
                  children: [
                    Expanded(child: PageView.builder(itemCount: coffees.length,
                        controller:_pageTextController,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder:(context,index){
                      final opacity=(1-(index- _textPage).abs()).clamp(0.0, 1.0);
                      return Opacity(
                          opacity: opacity,
                          child: Padding(
                            padding:EdgeInsets.symmetric(horizontal: size.width*0.2),
                            child:Hero(
                            tag: "text_${coffees}",
                            child:Material (
                             child: Text(
                               //coffees[index].name,
                              coffees[index].name,
                              maxLines: 2,
                                textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w800,
                              ),

                            ),
                          ))));}
                    )),
                     const SizedBox(height: 15,),
                    AnimatedSwitcher(
                        duration:_duration,
                     child: Text('\$${coffees[_curentPage.toInt()].price.toStringAsFixed(2)}',
                     style: TextStyle(fontSize: 24),
                     key: Key(coffees[_curentPage.toInt()].name),
                     )
                    ),

                  ],
               ),
             ),),
       ],),
     );
   }
}
