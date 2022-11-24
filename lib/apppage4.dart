import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sayriapp/volate.dart';
import 'package:share_plus/share_plus.dart';

class four extends StatefulWidget {
  int index;
  List<String> l;

  four(this.index, this.l);

  @override
  State<four> createState() => _fourState();
}

class _fourState extends State<four> {
  String imm = 'image/s1.jpg';
  double size = 20;
  int count = 0;
  bool gr_button = true;

  Color co2 = Colors.white;
  String emoji1 = '😃 😄 😁 😆 😅 😂 🤣';

  List fontlist = ["f1", "f2", "f3", "f4", "f5", "f6", "f7", "f8", "f9", "f10"];
  String fontfam = 'f1';

  String folder = "";

  List<Color> grad = [Color(0xFFD01818), Color(0xFF369025), Color(0xFFB4B208)];

  GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    create_folder();
  }

  Future<Uint8List> _capturePng() async {
    var pngBytes;
    try {
      print('inside');
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      pngBytes = byteData!.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      print(pngBytes);
      print(bs64);
      setState(() {});
      return pngBytes;
    } catch (e) {
      print(e);
    }
    return pngBytes;
  }

  create_folder() async {
    var path = await ExternalPath.getExternalStoragePublicDirectory(
            ExternalPath.DIRECTORY_DOWNLOADS) +
        "/sayari 2022";

    Directory directory = Directory(path);
    if (await directory.exists()) {
      print('it is created');
    } else {
      await directory.create();
      print('created');
    }
    folder = directory.path;
  }

  @override
  Widget build(BuildContext context) {
    grad = volate().gr[count];
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 4,
            child:SingleChildScrollView(
              child: RepaintBoundary(
                key: _globalKey,
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  decoration: gr_button
                      ? BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(imm), fit: BoxFit.cover),
                  )
                      : BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: grad,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "${emoji1}\n${widget.l[widget.index]}\n${emoji1}",
                      style: TextStyle(
                          fontSize: size,
                          color: co2,
                          fontFamily: fontfam,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.black,
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              count++;
                              setState(() {
                                if (count < volate().gr.length - 1) {
                                  grad = volate().gr[count];
                                } else {
                                  count = 0;
                                }
                                gr_button = false;
                              });
                            },
                            icon: Icon(
                              Icons.cached_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  barrierColor: Colors.transparent,
                                  builder: (context) {
                                    return Container(
                                      height: 720,
                                      color: Colors.blueGrey,
                                      child: GridView.builder(
                                          itemCount: volate().gr.length,
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                setState(() {
                                                  gr_button = false;
                                                  count = index;
                                                  grad = volate().gr[index];
                                                });
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.all(10),
                                                child: Center(
                                                    child: Text(
                                                  "${emoji1}\n     Types   of   Shayari\n${emoji1}",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white),
                                                )),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  gradient: LinearGradient(
                                                    colors: volate().gr[index],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2)),
                                    );
                                  },
                                  context: context);
                            },
                            icon: Icon(
                              Icons.zoom_out_map,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    )),
                    Expanded(
                        child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              child: Container(
                                color: Colors.pink,
                                margin: EdgeInsets.all(5),
                                alignment: Alignment.center,
                                child: Text(
                                  "Background",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              onTap: () {
                                showModalBottomSheet(
                                    builder: (context) {
                                      return Container(
                                          height: 150,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: GridView.builder(
                                                  itemCount:
                                                      volate().imm1.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return InkWell(
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        margin:
                                                            EdgeInsets.all(5),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  volate().imm1[
                                                                      index]),
                                                              fit:
                                                                  BoxFit.cover),
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        setState(() {
                                                          print("jenish");

                                                          gr_button = true;
                                                          imm = volate()
                                                              .imm1[index];
                                                        });
                                                      },
                                                    );
                                                  },
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 4),
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  icon: Icon(Icons.clear)),
                                            ],
                                          ));
                                    },
                                    context: context);
                              },
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                color: Colors.pink,
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(5),
                                child: Center(
                                  child: Text(
                                    "Textcolor",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ),
                              onTap: () {
                                showDialog(
                                    builder: (context) {
                                      return AlertDialog(
                                        content: ColorPicker(
                                            onColorChanged: (value) {
                                              setState(() {
                                                co2 = value;
                                              });
                                            },
                                            pickerColor: co2),
                                      );
                                    },
                                    context: context);
                              },
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                DateTime dt = DateTime.now();
                                String imag =
                                    "${dt.year.toString()}${dt.month.toString()}${dt.day.toString()}${dt.hour.toString()}${dt.minute.toString()}${dt.second.toString()}${dt.millisecond.toString()}";
                                String make = "${folder}/image${imag}.jpg";
                                File file = File(make);
                                file.create().then((value) {
                                  print(value.path);
                                  _capturePng().then((value) {
                                    print("file is write");
                                    file.writeAsBytes(value).then((value) {
                                      Share.shareFiles(
                                          ['${value.path}']);
                                    });
                                  });
                                });
                              },
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                color: Colors.pink,
                                margin: EdgeInsets.all(5),
                                alignment: Alignment.center,
                                child: Text(
                                  "Share",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                    Expanded(
                        child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                color: Colors.pink,
                                margin: EdgeInsets.all(5),
                                alignment: Alignment.center,
                                child: Text(
                                  "Font",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              onTap: () {
                                showModalBottomSheet(
                                    builder: (context) {
                                      return Container(
                                        height: 80,
                                        color: Colors.blueGrey,
                                        child: GridView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: fontlist.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    fontfam = fontlist[index];
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: Colors.pinkAccent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  margin: EdgeInsets.all(5),
                                                  child: Center(
                                                      child: Text(
                                                    "Font",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            fontlist[index],
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  )),
                                                ),
                                              );
                                            },
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 1)),
                                      );
                                    },
                                    context: context);
                              },
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                color: Colors.pink,
                                margin: EdgeInsets.all(5),
                                alignment: Alignment.center,
                                child: Text(
                                  "Emoji",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              onTap: () {
                                showModalBottomSheet(
                                    barrierColor: Colors.transparent,
                                    builder: (context) {
                                      return Container(
                                        height: 150,
                                        child: ListView.builder(
                                          itemCount: volate().emoji.length,
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              child: Container(
                                                height: 50,
                                                width: double.infinity,
                                                color: Colors.black,
                                                margin: EdgeInsets.all(5),
                                                child: Center(
                                                    child: Text(
                                                        volate().emoji[index])),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  emoji1 =
                                                      volate().emoji[index];
                                                });
                                              },
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    context: context);
                              },
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                color: Colors.pink,
                                margin: EdgeInsets.all(5),
                                alignment: Alignment.center,
                                child: Text(
                                  "Text Size",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              onTap: () {
                                showModalBottomSheet(
                                    builder: (context) {
                                      return Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.black,

                                        ),
                                        child: StatefulBuilder(
                                          builder: (context, setState1) {
                                            return Slider(
                                                max: 50,
                                                min: 10,
                                                onChanged: (value) {
                                                  size = value;
                                                  setState1(() {});
                                                  setState(() {});
                                                },
                                                value: size);
                                          },
                                        ),
                                      );
                                    },
                                    context: context);
                              },
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              )),
        ],
      )),
    );
  }
}
