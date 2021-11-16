import 'dart:async';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

class NewsPaper extends StatefulWidget {
  const NewsPaper({Key? key}) : super(key: key);

  @override
  State<NewsPaper> createState() => _NewsPaperState();
}

class _NewsPaperState extends State<NewsPaper> {
  final urlImage = [
    //buss
    'https://blog.topcv.vn/wp-content/uploads/2021/09/0.2labusinessportal-15912414682771313787976.jpg',
    //enter
    'https://www.pwc.com.au/digitalpulse/2019/06/digital-pulse-gmeo-2019.jpg',
    //
    'https://cdn.vietnambiz.vn/2019/8/10/sis-dilemma-ttg-topofmind-750x350-e14951336804161-1565426422753613744677.png',
    // sport
    'https://sym.edu.vn/wp-content/uploads/2021/01/11-2.png',
  ];
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: RichText(
        text: const TextSpan(children: [
          TextSpan(
              text: 'Flutter',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w700)),
          TextSpan(
              text: 'News',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700)),
        ]),
      ),
    );
  }

  Widget _body() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(height: 100),
            itemCount: urlImage.length,
            itemBuilder: (context, index, realIndex) {
              final urlImages = urlImage[index];
              return Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    urlImages,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: FutureBuilder<List<Model>>(
                future: fetchData(),
                builder: (context, snapshot) {
                  var data = snapshot.data;
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: data!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        bottom: 10, top: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: Image.network(
                                        data[index].image.toString(),
                                        fit: BoxFit.cover,
                                        loadingBuilder: (context, child,
                                                progress) =>
                                            progress == null
                                                ? child
                                                : Container(
                                                    padding:
                                                        const EdgeInsets.all(0),
                                                    height: 100,
                                                    child: const Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    ),
                                                  ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 10),
                                    child: Text(
                                      data[index].title,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Text(
                                    data[index].description,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            );
                          })
                      : const Center(child: CircularProgressIndicator());
                }),
          ),
        ],
      ),
    );
  }

  Future<List<Model>> fetchData() async {
    String url =
        'https://newsapi.org/v2/everything?q=tesla&from=2021-10-16&sortBy=publishedAt&apiKey=a1b7edb196d444c4be6c1ec252d4c968';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<Model> listModel = [];
      var listResponseModel =
          (json.decode(response.body)["articles"] as List<dynamic>)
              .cast<Map<String, dynamic>>()
              .map<Model>((e) => Model.fromJson(e))
              .toList();
      listModel.addAll(listResponseModel);

      return listModel;
    } else {
      throw Exception(response.statusCode);
    }
  }
}

class Model {
  dynamic title;
  dynamic description;
  dynamic image;
  dynamic url;

  Model(
      {required this.title,
      required this.description,
      required this.image,
      required this.url});

  Model.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    description = json["description"];
    image = json["urlToImage"];
    url = json["url"];
  }
}
