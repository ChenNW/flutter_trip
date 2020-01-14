import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const ScrollContentOffSetY = 120;

class home_page extends StatefulWidget {
  @override
  _home_Page createState() => _home_Page();
}

class _home_Page extends State<home_page> {
  List imagesArray = [
    'https://gss0.baidu.com/7LsWdDW5_xN3otqbppnN2DJv/space/pic/item/ca1349540923dd54958d43f9df09b3de9d8248a1.jpg',
    'https://gss0.baidu.com/7LsWdDW5_xN3otqbppnN2DJv/space/pic/item/5bafa40f4bfbfbedbfa0d2ee76f0f736aec31fa1.jpg',
    'https://gss0.baidu.com/7LsWdDW5_xN3otqbppnN2DJv/space/pic/item/d31b0ef41bd5ad6e2a73807b8fcb39dbb7fd3c9d.jpg'
  ];
  double appBarAlph = 0.0;

  _scrollContentOffSetY(offset) {
    double alph = offset / ScrollContentOffSetY;
    if (alph < 0) {
      alph = 0;
    } else if (alph > 1) {
      alph = 1;
    }

    setState(() {
      appBarAlph = alph;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: NotificationListener(
            onNotification: (ScrollNotification) {
              if (ScrollNotification is ScrollUpdateNotification &&
                  ScrollNotification.depth == 0) {
                //第0个元素的时候才开始监听

                _scrollContentOffSetY(ScrollNotification.metrics.pixels);
              }
            },
            child: ListView(
              children: <Widget>[
                Container(
                  height: 230,
                  child: Swiper(
                    itemCount: imagesArray.length,
                    pagination: SwiperPagination(),
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(
                        imagesArray[index],
                        fit: BoxFit.fill,
                      );
                    },
                    autoplay: true,
                    onTap: (index) {
                      print(index);
                    },
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Text('哈哈'),
                  ),
                  height: 800,
                )
              ],
            ),
          ),
        ),
        Opacity(
            opacity: appBarAlph,
            child: Container(
              height: 88,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 44),
                  child: Text('首页'),
                ),
              ),
            ))
      ],
    ));
  }
}
