import 'package:flutter/material.dart';
import 'package:flutter_app/TipRoute.dart';

class RouterTestRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试路由页面'),
      ),
      body:  Center(
        child: RaisedButton(
          onPressed: () async {
            // 异步打开`TipRoute`，并等待返回结果
            var result = await Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return TipRoute(
                    text: "我是参数",
                  );
                }
            ));
            //输出`TipRoute`路由返回结果
            print("路由返回值: $result");
          },
          child: Text("打开提示页面"),
        ),
      )
    );
  }
}
