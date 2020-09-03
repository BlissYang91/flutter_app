import 'package:flutter/material.dart';

class TipRoute extends StatelessWidget{
  final String text;
  //构造函数接受参数
  TipRoute({
    Key key,
    @required this.text
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('提示'),
        ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: [
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context,"返回上一页"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}