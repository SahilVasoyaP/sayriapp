import 'package:flutter/material.dart';
import 'package:sayriapp/apppage3.dart';
import 'package:sayriapp/volate.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class second extends StatefulWidget {
  int index;
  String name;
  String image;

  second(this.index, this.name, this.image);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  List<String> l = [];

  @override
  void initState() {
    super.initState();

    if (widget.index == 0) {
      l = volate.congra;
    } else if (widget.index == 1) {
      l = volate.Friend;
    } else if (widget.index == 2) {
      l = volate.comedy;
    } else if (widget.index == 3) {
      l = volate.army;
    } else if (widget.index == 4) {
      l = volate.rela;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.pink,
          backgroundColor: Colors.pink,
          title: DefaultTextStyle(
              style: TextStyle(fontSize: 20, color: Colors.white),
              child: AnimatedTextKit(animatedTexts: [
                WavyAnimatedText(volate.name[widget.index]),
              ],
                isRepeatingAnimation: true,
                repeatForever: true,
              ))),
      backgroundColor: Colors.black,
      body:       ListView.builder(
          itemCount: l.length,
          itemBuilder: (context, index) {
            return Center(
              child: Card(
                margin: EdgeInsets.all(5),
                color: Colors.pink,
                elevation: 20,
                shadowColor: Colors.pink,
                child: Center(
                  child: ListTile(
                    hoverColor: Colors.deepPurple,
                    focusColor: Colors.blue,
                    selectedColor: Colors.teal,
                    leading: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(volate.image[widget.index]),
                        ),
                      ),
                    ),
                    title: Text(
                      l[index],
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      size: 30,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return three(l, index);
                        },
                      ));
                    },
                  ),
                ),
              ),
            );
          },
        ),


    );
  }
}
