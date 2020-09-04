import 'package:flutter/material.dart';

///父组件管理子组件状态
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
        child: TapboxB(onChanged: _handleTapboxChanged,active: _active,)//通过回调将其状态导出到其父组件
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
/// 混合状态管理 父组件管理外部状态，子组件管理自身状态
class ParentWidgetC extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ParentWidgetCState();

}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;
  void _handleTapboxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxC(active: _active,onChanged: _handleTapboxChanged,),
    );
  }
  
}

class TapboxC extends StatefulWidget{
  final bool active;
  final ValueChanged<bool> onChanged;

  const TapboxC({Key key, this.active:false, @required this.onChanged}) : super(key: key);

  @override
  _TapboxCState createState() => _TapboxCState();

}

class _TapboxCState extends State<TapboxC>{
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details){
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details){
    setState(() {
      _highlight = false;
    });
  }
  void _handleTapCancel(){
    setState(() {
      _highlight = false;
    });
  }
  void _handleTap(){
    widget.onChanged(!widget.active);
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(widget.active? 'Active' : 'Inactive',style: TextStyle(fontSize: 32.0,color: Colors.white),),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700]:Colors.grey[600],
          border: _highlight?Border.all(color: Colors.teal[700],width: 10.0):null,
        ),
      ),
    );
  }

}


