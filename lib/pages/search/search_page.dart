import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeappflutter/view_models/recipe_list_view_model.dart';
import 'package:recipeappflutter/widgets/loading.dart';
import 'package:recipeappflutter/widgets/recipe_list.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // you can uncomment this to get all batman movies when the page is loaded
    Provider.of<RecipeListViewModel>(context, listen: false)
        .fetchRandomRecipes();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<RecipeListViewModel>(context);
    return Container(
        padding: EdgeInsets.all(16),
        child: Column(children: <Widget>[
          Card(
            margin: EdgeInsets.only(top: 36, bottom: 16),
            child: Container(
                padding: EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _controller,
                  onSubmitted: (value) async {
                    if (value.isNotEmpty) {
                      await data.searchRecipe(value);
                      setState(() {});
                    }
                  },
                  style: TextStyle(color: Color.fromRGBO(250, 120, 130, 1)),
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle:
                        TextStyle(color: Color.fromRGBO(250, 120, 130, 0.5)),
                    border: InputBorder.none
                  ),
                )),
          ),
          Expanded(child: _getData(data))
        ]));
  }

  Widget _getData(data) {
    print(data.loading);
    if (!data.loading && data.recipes != null)
      return RecipeList(recipes: data.recipes);
    else if (data.loading)
      return Loading();
    else
      return Text('Something Wrong');
  }
}
