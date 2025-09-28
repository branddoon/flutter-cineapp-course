
import 'package:cineapp/domain/entities/actor.dart';
import 'package:cineapp/presentation/providers/actors/actors_repository_provder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final actorsByMovieProvider = StateNotifierProvider<ActorByMovieNotifier, Map<String, List<Actor>>>((ref){
  final actors = ref.watch(actorsRepositoryProvider);
  return ActorByMovieNotifier(
    getActors: actors.getActorsByMovie
  );
});


typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorByMovieNotifier extends StateNotifier<Map<String, List<Actor>>>{

  final GetActorsCallback getActors;

  ActorByMovieNotifier({required this.getActors}): super({});

  Future<void> loadActors(String movieId)async{

    if(state[movieId] != null) return;
    final actors = await getActors(movieId);
    state = { ... state, movieId: actors};

  }

}

