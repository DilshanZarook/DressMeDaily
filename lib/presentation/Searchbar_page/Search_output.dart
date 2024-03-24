import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Search_output extends StatefulWidget {
  final String imageName;

  Search_output({Key? key, required this.imageName}) : super(key: key);

  @override
  _Search_outputState createState() => _Search_outputState();
}

class _Search_outputState extends State<Search_output> {
  bool _showOnlineShops = false;

  Future<List<String>> _searchImages() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    ListResult result = await storage.ref('wardrobe').listAll();
    List<String> imageUrls = [];

    String searchKey = widget.imageName.toLowerCase();
    for (var ref in result.items) {
      if (ref.name.toLowerCase().contains(searchKey)) {
        String url = await ref.getDownloadURL();
        imageUrls.add(url);
      }
    }

    return imageUrls;
  }

  Future<List<String>> _fetchImagesFromStorage() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    ListResult result = await storage.ref('Online_Shops').listAll();
    List<String> imageUrls = [];

    String searchKey = widget.imageName.toLowerCase();
    for (var ref in result.items) {
      if (ref.name.toLowerCase().contains(searchKey)) {
        String url = await ref.getDownloadURL();
        imageUrls.add(url);
      }
    }

    return imageUrls;
  }

  void _showNotFoundDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Outfit Not Found!'),
          content: Text('Would you like to continue to Online Shops?'),
          actions: [
            TextButton(
              child: Text('Go to the shop!'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, // Set the text color to white
                backgroundColor: Colors.green, // Set the background color to green
              ),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _showOnlineShops = true;
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Results')),
      body: _showOnlineShops
          ? FutureBuilder<List<String>>(
        future: _fetchImagesFromStorage(),
        builder: (context, snapshot) {
          return _buildParallaxView(snapshot);
        },
      )
          : FutureBuilder<List<String>>(
        future: _searchImages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _showNotFoundDialog();
            });
            return SizedBox.shrink();
          } else {
            return _buildParallaxView(snapshot);
          }
        },
      ),
    );
  }

  Widget _buildParallaxView(AsyncSnapshot<List<String>> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return Center(child: Text('No results found'));
    } else {
      var imageUrls = snapshot.data!;
      return ExampleParallax(imageUrls: imageUrls);
    }
  }
}

class ExampleParallax extends StatelessWidget {
  final List<String> imageUrls;

  ExampleParallax({Key? key, required this.imageUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (final imageUrl in imageUrls)
            ImageItem(
              imageUrl: imageUrl,
            ),
        ],
      ),
    );
  }
}

class ImageItem extends StatelessWidget {
  final String imageUrl;
  final GlobalKey _backgroundImageKey = GlobalKey();

  ImageItem({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showImagePopup(context, imageUrl),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                _buildParallaxBackground(context),
                _buildGradient(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showImagePopup(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Image.network(imageUrl, fit: BoxFit.cover),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Close',
                style: TextStyle(color: Colors.black), // Set text color to black
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context)!,
        listItemContext: context,
        backgroundImageKey: _backgroundImageKey,
      ),
      children: [
        Image.network(
          imageUrl,
          key: _backgroundImageKey,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.95],
          ),
        ),
      ),
    );
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      width: constraints.maxWidth,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
      listItemBox.size.centerLeft(Offset.zero),
      ancestor: scrollableBox,
    );

    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
    (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect =
    verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    context.paintChild(
      0,
      transform:
      Transform.translate(offset: Offset(0.0, childRect.top)).transform,
    );
  }

  @override
  bool shouldRepaint(covariant ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}
