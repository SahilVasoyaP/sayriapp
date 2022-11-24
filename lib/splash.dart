import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sayriapp/apppage1.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class screen extends StatefulWidget {
  const screen({Key? key}) : super(key: key);

  @override
  State<screen> createState() => _screenState();
}

class _screenState extends State<screen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                height: 80,
                width: 80,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),

                  image: DecorationImage(image: AssetImage('image/imlogo.png'),fit: BoxFit.cover),

                ),
              ),
            ),
          ),
          Container(
            height: 80,
            width: double.infinity,
            child: Column(
              children: [
                Center(child: Text("from",style: TextStyle(fontSize: 15,color: Colors.white),)),
                Center(child: Text("sahil vasoya",style: TextStyle(fontSize: 25,color: Colors.white),)),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
  super.initState();
  spscreen();
  }
  spscreen() async {
    var status = await Permission.storage.status;

    if(status.isDenied)
      {
        await[Permission.storage].request();
      }


    await Future.delayed(Duration(seconds: 3));
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
     return first();
   },));
  }

}
