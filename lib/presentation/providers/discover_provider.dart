import 'package:flutter/material.dart';
import 'package:tiktok/domain/entities/video_post.dart';
import 'package:tiktok/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videsRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({
    required this.videsRepository,
  });

  Future<void> loadPageNext() async {
    // final List<VideoPost> newVideos = videoPosts
    //     .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
    //     .toList();

    final newVideos = await videsRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
