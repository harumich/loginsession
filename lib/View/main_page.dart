import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController contentController = TextEditingController();  //テキストフィールドの入力値を取得するための設定

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('新規投稿', style: TextStyle(color: Colors.black),),
        backgroundColor: Theme.of(context).canvasColor,//bodyと同じ色の背景に
        elevation: 2,
        iconTheme: IconThemeData(color: Colors.black),  //戻る矢印を黒色にする
      ),
      body: Text('ログイン成功！', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    );
  }
}
