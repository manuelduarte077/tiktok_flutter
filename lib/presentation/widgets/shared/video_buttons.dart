import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/config/helpers/human_formats.dart';

import 'package:tiktok/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _CustomIconButton(
          value: video.likes,
          iconData: Icons.favorite,
          color: Colors.red,
        ),
        const SizedBox(height: 10),
        _CustomIconButton(
          value: video.views,
          iconData: Icons.remove_red_eye_sharp,
        ),
        const SizedBox(height: 10),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: const _CustomIconButton(
            value: 0,
            iconData: Icons.play_circle_outline,
          ),
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;

  const _CustomIconButton({
    required this.value,
    required this.iconData,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(iconData, size: 30),
          color: color,
        ),
        if (value > 0)
          Text(
            HumanFormats.humanReadbleNumber(value.toDouble()),
          ),
      ],
    );
  }
}
