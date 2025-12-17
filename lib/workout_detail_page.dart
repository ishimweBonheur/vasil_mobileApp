import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WorkoutDetailPage extends StatefulWidget {
  final String title;
  final String subtitle;
  final String asset;

  const WorkoutDetailPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.asset,
  });

  @override
  State<WorkoutDetailPage> createState() => _WorkoutDetailPageState();
}

class _WorkoutDetailPageState extends State<WorkoutDetailPage> {
  bool playing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.black87),
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black87),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 260,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SvgPicture.asset(widget.asset, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.subtitle,
                style: const TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '2:39',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Progress 2:39 / 5:20',
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.skip_previous),
                        ),
                        FloatingActionButton.small(
                          onPressed: () {
                            setState(() {
                              playing = !playing;
                            });
                          },
                          child: Icon(playing ? Icons.pause : Icons.play_arrow),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.skip_next),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
