import 'package:flutter/material.dart';
import 'package:flutter_app/NewRoute.dart';
import 'package:flutter_app/RouterTestRoute.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '您已经按下的次数:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FlatButton(
              child: Text("打开带返回新页面"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(
                    context,
                     MaterialPageRoute(builder: (context){
                      return NewRoute();
                    })
                );
              },
            ),
            FlatButton(
              child: Text('测试路由页面'),
              textColor: Colors.red,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return RouterTestRoute();
                }));
              },
            ),
            RandomWordsWidget(), //添加组件
            Echo(text: "参数组件",)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '加一',
        child: Icon(Icons.add),
      ),
    );
  }
}

/// 生成随机字符串 组件
class RandomWordsWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }

}

///Widget
class Echo extends StatelessWidget{
  final String text;
  final Color backgroundColor;

  const Echo({Key key, this.text,@required this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }

}
