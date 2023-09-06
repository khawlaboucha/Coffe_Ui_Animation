import 'package:flutter/material.dart';
import 'coffe.dart';
import 'coffe_consepts_list.dart';

class CoffeConseptsDetails extends StatelessWidget {
  const CoffeConseptsDetails({Key? key, required this.coffe}) ;
  final Coffee coffe;
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:IconButton(
          icon:Icon(Icons.arrow_back_ios_new),
          color: Colors.black, onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context)=>CoffeConseptList()));  },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal:size.width*0.2),
            child: Hero(
              tag:coffe.name,
              child:Material(
                child: Text(
                  coffe.name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color:Colors.black,
                  ),
                ),
              ),
            ),
          ),        const SizedBox(height: 50),
          SizedBox(
            height: size.height*0.4,
            child: Stack(
              children: [                Positioned.fill(
                    child:Hero(
                  tag: coffe.name, child:
                    Image.asset(coffe.image,fit: BoxFit.fitHeight,),
                )),
                Positioned(
                    left: size.width*0.07,
                    bottom: 0,
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 1.0,end: 0.0),
                      builder: (context,value,child){
                        return Transform.translate(offset: Offset(-100 *value,240 * value),
                         child: child,);
                      },
                      duration: const Duration(milliseconds: 500),
                         child: Text(
                          '\$${coffe.price.toStringAsFixed(2)}',
                         style: TextStyle(
                           fontSize: 50,
                           fontWeight: FontWeight.w900,
                           color:Colors.black,
                           shadows: [
                             BoxShadow(
                               color: Colors.black45
                             )
                           ]
                         ),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
