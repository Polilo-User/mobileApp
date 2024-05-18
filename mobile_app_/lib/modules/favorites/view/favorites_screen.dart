




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/widgets.dart';
import 'package:get_it/get_it.dart';

import '../../../repositories/user_repository/user_repository.dart';
import 'package:mobile_app_/repositories/rooms/favorites_repository.dart';
import 'package:mobile_app_/repositories/residence_complex/redince_complex.dart' as models;
import 'package:mobile_app_/modules/rooms_list/widgets/widgets.dart';

import '../bloc/favorites_bloc.dart';


// /favorites-screen
class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {

  final _favoritesBloc = FavoritesBloc(GetIt.I<UserRepository>(), GetIt.I<FavoritesRepository>());

  @override
  void initState() {
    // добавляем event проверки авторизации
    _favoritesBloc.add(FavoritesCheckAuth());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final thm = Theme.of(context);
    return
      Scaffold(

        body: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.02,
            bottom: MediaQuery.of(context).size.height * 0.02,
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                ),
                child: HardBackArrow(),
              ),
              Text("Избранное", style: thm.textTheme.bodyLarge,),
              BlocBuilder<FavoritesBloc, FavoritesState>(
                bloc: _favoritesBloc,
                builder: (context, state) {

                  // не вошли в аккаунт
                  if (state is FavoritesAuthMissed) {
                    return Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05,
                      ),
                      child: Column(
                        children: [
                          const Text("Войдите в аккаунт пожалуйста 🔒🔑"),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("/user-screen");
                            },
                            child: const Text("Войти в аккаунт",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                              ),
                            ),
                          ),
                        ],
                      )
                    );
                  }

                  // в избранном пусто
                  if (state is FavoritesEmpty) {
                    return Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05,
                        left: MediaQuery.of(context).size.width * 0.1,
                        right: MediaQuery.of(context).size.width * 0.1,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("В избранном пусто, но у нас полно недвижимости на любой вкус 🏙️"),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          const Text("Еще у нас есть чат с консультантами"),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                          Text("(в MVP случайные сообщения)", style: thm.textTheme.bodySmall),
                        ],
                      )
                    );
                  }

                  // тут если вошли и загрузили
                  if (state is FavoritesLoaded) {
                    return
                        Expanded(
                            child:
                            ListView.builder(
                                itemCount: state.rooms.length,
                                itemBuilder: (context, i) {
                                  return ListTile(
                                    title: InkWell(
                                        child: Room(room: state.rooms[i]),
                                        onTap: () {
                                          setState(() {});
                                          Navigator.pop(context);
                                          Navigator.of(context).pushNamed("/room-screen", arguments: { 'room' : state.rooms[i], "fromFavorites": true } );
                                        }
                                    ),
                                  );
                                }
                            )
                        );
                  }

                  return Text("_favoritesBloc error");
                }
              )
            ],
          )
        )
      );
  }
}

