import 'package:flutter/material.dart';
import 'screens/news_list.dart';
import 'screens/news_detail.dart';
import 'blocs/stories_provider.dart';
import 'blocs/comments_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommentsProvider(
      child: StoriesProvider(
        child: MaterialApp(
          title: 'News!',
          theme: new ThemeData(
            primarySwatch: Colors.green,
          ),
          onGenerateRoute: (RouteSettings settings) {
            return routes(settings);
          },
        ),
      ),
    );
  }

  Route routes(RouteSettings settings) {
    print('route name:${settings.name}');
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (context) {
          final storiesBlock = StoriesProvider.of(context);
          storiesBlock.fetchTopIds();

          return NewsList();
        },
      );
    } else {
      return MaterialPageRoute(
        builder: (context) {
          final commentsBloc = CommentsProvider.of(context);
          final itemId = int.parse(settings.name.replaceFirst('/', ''));

          commentsBloc.fetchItemWithComments(itemId);

          return NewsDetail(
            itemId: itemId,
          );
        },
      );
    }
  }
}
