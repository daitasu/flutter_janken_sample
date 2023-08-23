import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ImgSearchPage(),
    );
  }
}

class ImgSearchPage extends StatefulWidget {
  const ImgSearchPage({super.key});

  @override
  State<ImgSearchPage> createState() => _ImgSearchPageState();
}

class _ImgSearchPageState extends State<ImgSearchPage> {
  List hits = [];
  String query = '花';

  Future<void> fetchImages() async {
    Response response = await Dio().get(
        'https://pixabay.com/api/?key=38847204-143c9db58a89fb463b2edd56d&q=$query&image_type=photo');
    print(response.data['total']);

    hits = response.data['hits'];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          initialValue: query,
          decoration: const InputDecoration(
            fillColor: Colors.white,
            filled: true,
          ),
          onFieldSubmitted: (value) {
            query = value;
            fetchImages();
          },
        ),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: hits.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> hit = hits[index];
            return InkWell(
              onTap: () => {
                print('${hit['likes']}'),
              },
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    hit['previewURL'],
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.thumb_up_alt_outlined,
                            size: 15.0,
                          ),
                          Text('${hit['likes']}'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
