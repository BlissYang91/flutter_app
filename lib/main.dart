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
            Echo(text: "参数组件",),
            ParentWidget(),//父组件管理子组件状态
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
///widget的构造函数参数应使用命名参数，命名参数中的必要参数要添加@required标注，这样有利于静态代码分析器进行检查。
///另外，在继承widget时，第一个参数通常应该是Key，
///另外，如果Widget需要接收子Widget，那么child或children参数通常应被放在参数列表的最后。
///同样是按照惯例，Widget的属性应尽可能的被声明为final，防止被意外改变。
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

// ParentWidget 为 TapboxB 管理状态.
class ParentWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget>{
  bool _active = false;

  void _handleTapboxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: TapboxB(onChanged: _handleTapboxChanged,active: _active,)
    );
  }

}
///TapboxB子widget
class TapboxB extends StatelessWidget{
  final bool active;
  final ValueChanged<bool> onChanged;//值改变时候的回调方法

  const TapboxB({Key key, this.active:false, @required this.onChanged}) : super(key: key);

  void _handleTap(){
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: Text(
            active ? 'Active' :'Inactive',
            style: TextStyle(fontSize: 32.0,color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700]:Colors.grey[600]
        ),
      ),
    );
  }

}
