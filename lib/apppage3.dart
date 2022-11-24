import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sayriapp/apppage4.dart';
import 'package:share_plus/share_plus.dart';


class three extends StatefulWidget {
  List<String> l;
  int index;

  three(this.l, this.index);

  @override
  State<three> createState() => _threeState();
}

class _threeState extends State<three> {
  PageController pageController = new PageController();

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: DefaultTextStyle(style: TextStyle(fontSize: 20,color: Colors.white), child: AnimatedTextKit(animatedTexts: [
          WavyAnimatedText("   Love  sayari  "),
        ],
          isRepeatingAnimation: true,
          repeatForever: true,
        ),
        ),

      ),
      backgroundColor: Colors.black,
      body: SafeArea(
            child: Column(
              children: [

                Expanded(
                  child: PageView.builder(
                    itemCount: widget.l.length,
                    controller: pageController,
                    onPageChanged: (value) {

                      setState((){
                        widget.index = value;
                      });

                    },
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(image: AssetImage('image/s1.jpg'),fit: BoxFit.cover),
                        ),
                        child: Center(
                          child: Text(
                            widget.l[widget.index],
                            style: TextStyle(fontSize: 20, color: Colors.white,fontWeight:FontWeight.bold ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.pink,Colors.white,Colors.pink],
                  ),
                  ),
                  alignment: Alignment.center,

                  child: Text(
                    "${widget.index + 1}/${widget.l.length}",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ),
                Container(
                  color: Colors.pink,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {
                            FlutterClipboard.copy(widget.l[widget.index])
                                .then((value) => Fluttertoast.showToast(
                                msg: "Sayari is copied",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.white,
                                textColor: Colors.black,
                                fontSize: 10.0

                            ));
                          },
                          icon: Icon(Icons.copy, size: 25, color: Colors.white)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (widget.index != 0) {
                                widget.index--;
                                pageController.jumpToPage(widget.index);
                              }
                            });
                          },
                          icon: Center(
                            child: Icon(Icons.chevron_left,
                                size: 25, color: Colors.white),
                          )),
                      IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return four(widget.index, widget.l);
                              },
                            ));
                          },
                          icon: Icon(Icons.edit_off, size: 25, color: Colors.white)),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (widget.index < widget.l.length - 1) {
                              widget.index++;
                              pageController.jumpToPage(widget.index);
                            }
                          });
                        },
                        icon:
                        Icon(Icons.chevron_right, size: 25, color: Colors.white),
                      ),
                      IconButton(
                          onPressed: () async {
                           await Share.share('${widget.l[widget.index]}');
                          },
                          icon: Icon(Icons.share, size: 25, color: Colors.white)),
                    ],
                  ),
                ),
              ],
            )),

    );
  }
}
