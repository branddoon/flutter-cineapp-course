import 'package:cineapp/presentation/providers/providers.dart';
import 'package:cineapp/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _HomeView()
      ),
      bottomNavigationBar: CustomBottonNav(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);
    if(initialLoading) return const FullScreenLoader();
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final popularMovies =  ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
          ),
        ),
        SliverList(delegate: SliverChildBuilderDelegate(
          (context, index){
            return Column(
                      children: [
                        MoviesSlideShow(
                          movies: slideShowMovies),
                        MovieHorizontalListview(
                          title: 'En cines', 
                          subtitle: 'Lunes 20', 
                          movies: nowPlayingMovies,
                          loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage()
                          ,),
                        MovieHorizontalListview(
                          title: 'Proximamente', 
                          subtitle: 'Este mes', 
                          movies: upcomingMovies,
                          loadNextPage: () => ref.read(upcomingMoviesProvider.notifier).loadNextPage()
                          ,),
                        MovieHorizontalListview(
                          title: 'Populares', 
                          movies: popularMovies,
                          loadNextPage: () => ref.read(popularMoviesProvider.notifier).loadNextPage()
                          ,),
                          MovieHorizontalListview(
                          title: 'Mejor calificadas', 
                          movies: topRatedMovies,
                          loadNextPage: () => ref.read(topRatedMoviesProvider.notifier).loadNextPage()
                          ,),
                          const SizedBox(
                            height: 10,
                          )
                      ],
                    );
          },
          childCount: 1
        ))
      ],
    );
  }
}