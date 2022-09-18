import 'package:clickable_widget/clickable_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clickable widget Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Clickable widget Example")),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("ClickableContainer 👇"),
              // ClickableContainer
              ClickableContainer(
                onTap: () {
                  debugPrint("container tapped");
                },
                alignment: Alignment.center,
                width: 100.0,
                height: 100.0,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  "I'm a container. Tap me!",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              const Text("ClickableImage 👇"),
              // ClickableImage
              ClickableImage(
                onTap: () {
                  debugPrint("image tapped");
                },
                clickableImageType: ClickableImageType.network,
                src: "https://picsum.photos/150/150",
              ),
              const SizedBox(height: 16),
              const Text("ClickableCard 👇"),
              // ClickableCard
              ClickableCard(
                onDoubleTap: () {
                  debugPrint("You have double tapped the card");
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("I'm a clickable card. Double Tap me!"),
                ),
              ),
              const SizedBox(height: 16),
              const Text("ClickableGridTile 👇"),
              SizedBox(
                height: 100,
                width: 200,
                // ClickableGridTile
                child: ClickableGridTile(
                  onTap: () {
                    debugPrint("GridTile tapped!");
                  },
                  footer: const GridTileBar(
                    title: Text("I'm a clickable grid tile. Tap me!"),
                    backgroundColor: Colors.black38,
                  ),
                  child: Image.network(
                    "https://picsum.photos/100/100",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text("ClickableRow 👇"),
              ClickableRow(
                onTap: () {},
                children: const <Widget>[
                  Text("View more"),
                  Icon(Icons.chevron_right)
                ],
              ),
              const SizedBox(height: 16),
              const Text("ClickableColumn 👇"),
              ClickableColumn(
                onTap: () {},
                children: const <Widget>[
                  Icon(Icons.local_airport),
                  Text("Travel"),
                ],
              ),
              const SizedBox(height: 12),
              // Useful case of ClickableText
              const Text("Useful case of ClickableText 👇"),
              Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.start,
                spacing: 4,
                runSpacing: 4,
                children: [
                  const Text(
                    "By signing up, you agree to the",
                  ),
                  ClickableText(
                    "Terms of Service",
                    style: const TextStyle(color: Colors.blue),
                    onTap: () {
                      /* your code here */
                    },
                  ),
                  const Text("and"),
                  ClickableText(
                    "Privacy Policy",
                    style: const TextStyle(color: Colors.blue),
                    onTap: () {
                      /* your code here */
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
