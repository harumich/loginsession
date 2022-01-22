import 'package:flutter/material.dart';
import 'package:loginsession/View/start_up/login_page.dart';
import 'package:loginsession/model/account.dart';
import 'package:loginsession/utils/authentication.dart';
import 'package:loginsession/utils/firestore/users.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Account myAccount =Authentication.myAccount!;  //テキストフィールドの入力値を取得するための設定

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
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 20),
            Text('ログイン成功！', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 50),
            ElevatedButton(onPressed: () {
              Authentication.signOut();
              while(Navigator.canPop(context)) {
                Navigator.pop(context);
              }
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => LoginPage()
              ));
            },
                child: Text('ログアウト')
            ),
            SizedBox(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: () {
                  UserFirestore.deleteUser(myAccount.id);
                  Authentication.deleteAuth();
                  while(Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => LoginPage()
                  ));
                },
                child: Text('アカウント削除')
            ),
          ],
        ),
      ),
    );
  }
}
