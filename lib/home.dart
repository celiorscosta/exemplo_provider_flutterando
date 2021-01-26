import 'package:flutter/material.dart';
import 'package:flutter_application_1/hero_model.dart';
import 'package:provider/provider.dart';

import 'heroes_controller.dart';

//https://www.youtube.com/watch?v=5KIRXuRR9bk&list=TLPQMjYwMTIwMjHoZnS1NIiPWg&index=2

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _buildList() {
    HeroesController heroesController = Provider.of<HeroesController>(context);

    return ListView.builder(
      itemCount: heroesController.heroes.length,
      itemBuilder: (context, index) {
        return _buildItems(heroesController.heroes[index]);
      },
    );
  }

  _buildItems(HeroModel model) {
    HeroesController heroesController = Provider.of<HeroesController>(context);

    model.isFavorite = model.isFavorite ?? false;
    return ListTile(
      onTap: () {
        heroesController.checkFavorite(model);
      },
      title: Text(model.name),
      trailing: model.isFavorite
          ? Icon(Icons.star, color: Colors.yellow[900])
          : Icon(Icons.star_border),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
        centerTitle: true,
        leading: (Consumer<HeroesController>(
          builder: (context, heroesController, widget) {
            return Center(
              child: Text(
                '${heroesController.heroes.where((i) => i.isFavorite).length}',
                style: TextStyle(fontSize: 20.0),
              ),
            );
          },
        )),
      ),
      body: Consumer<HeroesController>(
        builder: (context, heroesController, widget) {
          return _buildList();
        },
      ),
    );
  }
}
