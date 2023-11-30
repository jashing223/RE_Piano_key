import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() => runApp(const MainPage());

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Column(
          children: [
            PianoKey(filename: "do.m4a"),
            const ExpandedInterval(),
            PianoKey(filename: "re.m4a"),
            const ExpandedInterval(),
            PianoKey(filename: "mi.m4a"),
            const ExpandedInterval(),
            PianoKey(filename: "fa.m4a"),
            const ExpandedInterval(),
            PianoKey(filename: "sol.m4a"),
            const ExpandedInterval(),
            PianoKey(filename: "la.m4a"),
            const ExpandedInterval(),
            PianoKey(filename: "si.m4a"),
            const ExpandedInterval(),
          ],
        ),
      ),
    );
  }
}

class PianoKey extends StatefulWidget {
  final String filename;
  final player = AudioPlayer();
  PianoKey({ Key? key, required this.filename}): super(key: key);

  @override
  State<PianoKey> createState() => _PianoKeyState();
}

class _PianoKeyState extends State<PianoKey> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 90,
      child: Row(
        children:[
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () async {
                await widget.player.setAsset("audio/${widget.filename}");
                widget.player.play();
              },
            ),
          ),
        ]
      )
    );
  }
}

class ExpandedInterval extends StatelessWidget {
  const ExpandedInterval({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          color: Colors.black45,
          height: 8,
        )
    );
  }
}
