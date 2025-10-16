import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_grid_layout/image_metadata.dart';

void main() {
  runApp(const ImageGridApp());
}

class ImageGridApp extends StatelessWidget {
  const ImageGridApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      title: 'Image Grid Layout',
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final columnCount = ((constraints.maxWidth / 350).ceil()).clamp(1, 4);
                return MasonryGridView.count(
                  padding: const EdgeInsets.all(16.0),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  itemCount: images.length,
                  crossAxisCount: columnCount,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                      child: Image.asset(images[index].url, semanticLabel: images[index].altText),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
