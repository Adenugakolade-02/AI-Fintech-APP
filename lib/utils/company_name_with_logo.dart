import 'package:flutter/material.dart';
import 'package:superlender/utils/constansts.dart';

class ComapanyNameWithLogo extends StatelessWidget {
  final double? height;
  final double? width;

  // final List<String> companyName = ['s','','u','p','e','r','l','e','n','d','e','r'];
  TextTheme textTheme = TEXT_THEME_DEFAULT;

  ComapanyNameWithLogo({Key? key, this.height, this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
    
      alignment: Alignment.center,
      height : height!*0.3,
      width: width,
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('s',style: textTheme.headline5),
                  const SizedBox(width: 2.5,),
                  Text('u',style: textTheme.headline5),
                  const SizedBox(width: 2.5,),
                  Text('p',style: textTheme.overline),
                  const SizedBox(width: 2.5,),
                  Text('e',style: textTheme.headline5),
                  const SizedBox(width: 2.5,),
                  Text('r',style: textTheme.headline5),
                  const SizedBox(width: 2.5,),
                  Text('l',style: textTheme.overline),
                  const SizedBox(width: 2.5,),
                  Text('e',style: textTheme.headline5),
                  const SizedBox(width: 2.5,),
                  Text('n',style: textTheme.headline5),
                  const SizedBox(width: 2.5,),
                  Text('d',style: textTheme.overline),
                  const SizedBox(width: 2.5,),
                  Text('e',style: textTheme.headline5),
                  const SizedBox(width: 2.5,),
                  Text('r',style: textTheme.headline5),
                  const SizedBox(width: 2.5,),
                ]
              ),
              Positioned(
                    bottom:10,
                    right:-60,
                    child: Container(
                      height : width! *1/4,
                      width: width!*  1/4,
                      child: Image.asset('assets/images/Logo Shapes 38.png',fit: BoxFit.contain)),
                  )
            ],
          ),
        ],
      ),
    );
  }
}