import 'package:flutter/material.dart';
import 'package:flutter_app/TipRoute.dart';

class RouterTestRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var img = AssetImage("images/icon_hint.png");

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('测试路由页面'),
      ),
      body: SingleChildScrollView(
        // controller: ScrollController(),
        // physics: BouncingScrollPhysics(),
          child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Image>[
                  Image(
                    image: img,
                    height: 50.0,
                    width: 100.0,
                    fit: BoxFit.contain,
                  ),
                  Image(
                    image: img,
                    height: 50,
                    width: 50.0,
                    fit: BoxFit.contain,
                  ),
                  Image(
                    image: img,
                    width: 100.0,
                    height: 50.0,
                    fit: BoxFit.cover,
                  ),
                  Image(
                    image: img,
                    width: 100.0,
                    height: 50.0,
                    fit: BoxFit.fitWidth,
                  ),
                  Image(
                    image: img,
                    width: 100.0,
                    height: 50.0,
                    fit: BoxFit.fitHeight,
                  ),
                  Image(
                    image: img,
                    width: 100.0,
                    height: 50.0,
                    fit: BoxFit.scaleDown,
                  ),
                  Image(
                    image: img,
                    height: 50.0,
                    width: 100.0,
                    fit: BoxFit.none,
                  ),
                  Image(
                    image: img,
                    width: 100.0,
                    color: Colors.blue,
                    colorBlendMode: BlendMode.difference,
                    fit: BoxFit.fill,
                  ),
                  Image(
                    image: img,
                    width: 100.0,
                    height: 200.0,
                    repeat: ImageRepeat.repeatY,
                  )
                ].map((e) => Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: 100,
                        child: e,
                      ),
                    ),
                    Text(e.fit.toString())
                  ],
                )).toList()
            ),
          )

      ),
      // Center(
      //   child: Column(
      //     children: [
      //       RaisedButton(
      //         onPressed: () async {
      //           // 异步打开`TipRoute`，并等待返回结果
      //           var result = await Navigator.push(context, MaterialPageRoute(
      //               builder: (context){
      //                 return TipRoute(
      //                   text: "我是参数",
      //                 );
      //               }
      //           ));
      //           //输出`TipRoute`路由返回结果
      //           print("路由返回值: $result");
      //         },
      //         child: Text("打开提示页面"),
      //       ),
      //     ],
      //   )
      // )
    );
  }
}

