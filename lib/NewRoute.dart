import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("新路由页面"),
      ),
      body: Center(
        child: Container(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "hello,"*5,
                textScaleFactor: 1.2,//主要是用于系统字体大小设置改变时对Flutter应用字体进行全局调整，而fontSize通常用于单个文本，字体大小不会跟随系统字体大小变化
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,//可以精确指定字体大小，而textScaleFactor只能通过缩放比例来控制。
                  height: 1.2,
                  fontFamily: "Courier",
                  background: Paint()..color = Colors.yellow,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed,
                ),),
              //对一个Text内容的不同部分按照不同的样式显示，
              Text.rich(TextSpan(
                children: [
                  TextSpan(
                    text: 'home: '
                  ),
                  TextSpan(
                    text: 'https://flutterchina.club',
                    style: TextStyle(
                      color: Colors.blue
                    ),
                    // recognizer: _tapRecognizer //点击处理
                  ),
                ]
              )),
              RaisedButton(
                child: Text('RaisedButton'),
                onPressed: (){},
              ),
              //扁平按钮，默认背景透明并不带阴影
              FlatButton(
                child: Text('FlatButton'),
                onPressed: (){},
              ),
              IconButton(
                icon: Icon(Icons.thumb_down),
                onPressed: (){},
              ),
              //带图标的按钮
              RaisedButton.icon(onPressed: (){}, icon: Icon(Icons.send), label: Text('发送')),
              OutlineButton.icon(onPressed: (){}, icon: Icon(Icons.add), label: Text('添加')),
              FlatButton.icon(onPressed: (){}, icon: Icon(Icons.info), label: Text('详情'))
            ],
          )
        ),
      ),
    );
  }
}