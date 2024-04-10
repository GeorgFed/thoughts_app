import 'package:flutter/material.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  final String _songTitle = 'Song Title';
  final String _songSubtitle = 'Song Subtitle';

  void _playPause() {
    // TODO: Implement audio playback logic
  }

  void _skipPrevious() {
    // TODO: Implement logic to skip to previous song
  }

  void _skipNext() {
    // TODO: Implement logic to skip to next song
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                  ),
                  onPressed: _skipPrevious,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                  onPressed: _playPause,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.skip_next,
                    color: Colors.white,
                  ),
                  onPressed: _skipNext,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              _songTitle,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white38,
              ),
            ),
            Text(
              _songSubtitle,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white38,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
