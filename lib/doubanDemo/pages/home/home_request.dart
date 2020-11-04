import '../model/home_model.dart';

class HomeRequest {
  // 模拟网络请求
  static Future<List<MovieItem>> getMovieList() async {
    final List<MovieItem> movies = [];

    Map<String, dynamic> movieMap = {
      'rating': {'average': 9.7},
      'title': '肖申克的救赎',
      'images': {
        'medium':
        'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p480747492.webp'
      },
      'year': '1994',
      'genres': ['犯罪', '剧情'],
      'casts': [
        {
          'name': '蒂姆 罗宾斯',
          'avatars': {
            'medium':
            'https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p230.webp'
          }
        },
        {
          'name': '摩根·弗里曼',
          'avatars': {
            'medium':
            'https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p230.webp'
          }
        }
      ],
      'directors': [
        {
          'name': '弗兰克 德拉邦特',
          'avatars': {
            'medium':
            'https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p230.webp'
          }
        }
      ],
      'original_title': 'The Shawshank Redemption'
    };
    MovieItem item = MovieItem.fromMap(movieMap);
    for (int i = 0; i < 30; i++) {
      movies.add(item);
    }
    return movies;
  }
}
