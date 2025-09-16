import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages(){
  
    final messages = <String>[
      'Cargando películas',
      'Comprando palomitas de maíz',
      'Esto esta tardando más de los esperado'
    ];

    return Stream.periodic(const Duration(milliseconds: 1200), (step){
      return messages[step];
    }).take(messages.length);
  } 

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 300,),
          Text('Espere por favor...'),
          SizedBox(height: 10,),
          CircularProgressIndicator(strokeWidth: 2,),
          SizedBox(height: 10,),
          StreamBuilder(
            stream:getLoadingMessages(),
            builder: (context, snapshot){
              if(snapshot.data != null){
                return Text(snapshot.data!);
              }
              return Text('Cargando...');
          }
          )
        ],
      ),
    );
  }
}