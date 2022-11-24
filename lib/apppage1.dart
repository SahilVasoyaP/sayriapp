import 'package:flutter/material.dart';
import 'package:sayriapp/apppage2.dart';
import 'package:sayriapp/volate.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  List<String> k = volate.name;
  List<String> k1 = volate.image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.pink,
        title: DefaultTextStyle(style: TextStyle(fontSize: 20,color: Colors.white), child: AnimatedTextKit(animatedTexts: [
          WavyAnimatedText("   Love  sayari  "),
        ],
          isRepeatingAnimation: true,
          repeatForever: true,
        ),
        ),
        backgroundColor: Colors.pink,

      ),
      backgroundColor: Colors.pink,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.black,

          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
        ),
        child: ListView.builder(
          itemCount: k.length,
          itemBuilder: (context, index) {
            return Card(

              margin: EdgeInsets.all(10),
              color: Colors.pink,
              elevation: 50,
              shadowColor: Colors.black,
              child: ListTile(

                  hoverColor: Colors.deepPurple,
                  focusColor: Colors.blue,
                  selectedColor: Colors.teal,
                  leading: Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(k1[index]),
                      ),
                    ),
                  ),
                  title: Text(
                    k[index],
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 30,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return second(index, k[index], k1[index]);
                      },
                    ));
                  }),
            );
          },
        ),
      ),
    );
  }
}
