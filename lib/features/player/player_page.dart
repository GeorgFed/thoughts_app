import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

import '../../common/logger.dart';
import '../../common/widgets/ta_pulsating_button.dart';
import 'player_di.dart';
import 'player_view_model.dart';
import 'seek_bar.dart';

class PlayerPage extends StatelessWidget {
  final String trackId;

  const PlayerPage({
    required this.trackId,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, _) => BlocProvider.value(
          value: ref.watch(PlayerDi.viewModel)..onInit(trackId),
          child: const _PlayerView(),
        ),
      );
}

class _PlayerView extends StatefulWidget {
  const _PlayerView();

  @override
  State<_PlayerView> createState() => _PlayerViewState();
}

class _PlayerViewState extends State<_PlayerView> {
  final player = AudioPlayer();

  final playlist = ConcatenatingAudioSource(
    children: [
      AudioSource.asset('assets/mp3/melody-of-nature-main.mp3'),
      AudioSource.asset('assets/mp3/moonlight.mp3'),
      AudioSource.asset('assets/mp3/sad-music.mp3'),
    ],
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  Future<void> init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());

    try {
      await player.setAudioSource(
        playlist,
      );
    } on PlayerException catch (e) {
      logger.e('Error loading audio source: $e');
    }
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }

  Future<void> _skipPrevious() async {
    await player.seekToPrevious();
  }

  Future<void> _skipNext() async {
    await player.seekToNext();
  }

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        player.positionStream,
        player.bufferedPositionStream,
        player.durationStream,
        (position, bufferedPosition, duration) => PositionData(
          position,
          bufferedPosition,
          duration ?? Duration.zero,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            // color: Colors.white,
          ),
          onPressed: context.pop,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      //  backgroundColor: Colors.black87,
      body: BlocBuilder<PlayerViewModel, PlayerPageState>(
        builder: (context, state) => switch (state) {
          PlayerStateIdle() => const SizedBox.shrink(),
          PlayerStateNotFound() => const SizedBox.shrink(),
          PlayerStateData(
            :final trackTitle,
            :final trackUrl,
            :final author,
            :final coverUrl,
          ) =>
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(flex: 2),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const Center(
                      child: TAPulsatingBlob(
                        minHeight: 56,
                        maxHeight: 80,
                        minWidth: 44,
                        maxWidth: 96,
                        minBlurRadius: 32,
                        maxBlurRadius: 90,
                        animationDuration: Duration(seconds: 3),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 144,
                        height: 144,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: theme.cardColor,
                          image: DecorationImage(
                            // Apply color filter to darken image
                            colorFilter: const ColorFilter.mode(
                              Colors.black26,
                              BlendMode.darken,
                            ),
                            image: AssetImage(coverUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 64,
                ),
                StreamBuilder<PlayerState>(
                  stream: player.playerStateStream,
                  builder: (context, snapshot) {
                    final playerState = snapshot.data;
                    final processingState = playerState?.processingState;
                    final playing = playerState?.playing;

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.skip_previous,
                            //  color: Colors.white,
                            size: 44,
                          ),
                          onPressed: _skipPrevious,
                        ),
                        ...[
                          if (processingState == ProcessingState.loading ||
                              processingState == ProcessingState.buffering)
                            Container(
                              margin: const EdgeInsets.all(8.0),
                              width: 64.0,
                              height: 64.0,
                              child: const CircularProgressIndicator(),
                            ),
                          if (playing != true)
                            IconButton(
                              icon: const Icon(Icons.play_arrow),
                              iconSize: 64.0,
                              onPressed: player.play,
                            ),
                          if (playing == true &&
                              processingState != ProcessingState.completed)
                            IconButton(
                              icon: const Icon(Icons.pause),
                              iconSize: 64.0,
                              onPressed: player.pause,
                            ),
                          if (processingState == ProcessingState.completed)
                            IconButton(
                              icon: const Icon(Icons.replay),
                              iconSize: 64.0,
                              onPressed: () => player.seek(Duration.zero),
                            ),
                        ],
                        IconButton(
                          icon: const Icon(
                            Icons.skip_next,
                            //  color: Colors.white,
                            size: 44,
                          ),
                          onPressed: _skipNext,
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  trackTitle,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall
                  //  ?.copyWith(color: Colors.white),
                  ,
                ),
                const SizedBox(height: 4),
                Text(
                  author,
                  style: theme.textTheme.bodyMedium
                  // ?.copyWith(color: Colors.white70),
                  ,
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      StreamBuilder<PositionData>(
                        stream: _positionDataStream,
                        builder: (context, snapshot) {
                          final positionData = snapshot.data;
                          return SeekBar(
                            duration: positionData?.duration ?? Duration.zero,
                            position: positionData?.position ?? Duration.zero,
                            bufferedPosition:
                                positionData?.bufferedPosition ?? Duration.zero,
                            onChangeEnd: player.seek,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
        },
      ),
    );
  }
}
