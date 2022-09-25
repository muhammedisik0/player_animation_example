import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isPlaying = false;
  final Duration animationDuration = const Duration(milliseconds: 750);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Example in Player'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: isPlaying ? 1.0 : 0.0,
            duration: animationDuration,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.music_note_rounded),
                SizedBox(width: 10),
                Text('Skye Cuillin', style: TextStyle(fontSize: 24)),
              ],
            ),
          ),
          const SizedBox(height: 50),
          SizedBox(
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedPositioned(
                  left: isPlaying ? 0 : -50,
                  duration: animationDuration,
                  child: const Icon(
                    Icons.skip_previous_rounded,
                    size: 50,
                  ),
                ),
                InkWell(
                  onTap: () => setState(() => isPlaying = !isPlaying),
                  child: AnimatedSwitcher(
                    duration: animationDuration,
                    child: Icon(
                      isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                      key: ValueKey(isPlaying ? 1 : 0),
                      size: 150,
                    ),
                  ),
                ),
                AnimatedPositioned(
                  right: isPlaying ? 0 : -50,
                  duration: animationDuration,
                  child: const Icon(
                    Icons.skip_next_rounded,
                    size: 50,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          AnimatedOpacity(
            opacity: isPlaying ? 1.0 : 0.0,
            duration: animationDuration,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('00:34'),
                  Expanded(
                    child: Slider(
                      value: 15,
                      onChanged: (value) {},
                      min: 0,
                      max: 100,
                      activeColor: Colors.black,
                      inactiveColor: Colors.black.withOpacity(0.5),
                      thumbColor: Colors.black,
                    ),
                  ),
                  const Text('03:52'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
