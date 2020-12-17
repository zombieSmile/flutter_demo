import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HeroAnimation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('HeroAnimation Demo'),
        ),
        body: HeroAnimationDemo(),
      ),
    );
  }
}

class HeroAnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 16 / 9,
        ),
        children: List.generate(20, (index) {
          final imageURL = "https://picsum.photos/500/500?random=$index";
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                  return FadeTransition(
                    opacity: animation,
                    child: ImageDetailPage(imageURL),
                  );
                }),
              );
            },
            child: Hero(
                tag: imageURL,
                child: Image.network(
                  imageURL,
                  fit: BoxFit.cover,
                )),
          );
        }),
      ),
    );
  }
}

class ImageDetailPage extends StatelessWidget {
  final String _imageURL;

  ImageDetailPage(this._imageURL);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Hero(
            tag: _imageURL,
            child: Image.network(_imageURL),
          ),
        ),
      ),
    );
  }
}
