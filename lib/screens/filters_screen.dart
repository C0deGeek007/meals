import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routenName='/filters';

  final Function saveFilters;

  FiltersScreen(this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gluteenFree=false;
  var _vegetarian=false;
  var _vegan=false;
  var _lactoseFree=false;

  Widget _buildSwitchListTile(String title,String description,bool currentValue,Function updateValue) {
    return  SwitchListTile(
                  title: Text(title),
                  value:currentValue ,
                  subtitle: Text(description),
                  onChanged: updateValue
                );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your filters'),
          actions: [
            IconButton(icon: Icon(Icons.save), onPressed:(){
              final selectedFilters= {
                'gluten':_gluteenFree,
                'lactose':_lactoseFree,
                'vegan':_vegan,
                'vegetarian':_vegetarian,
              };
               widget.saveFilters(selectedFilters,context);//my changes
               })
          ],
        ),
        drawer: MainDrawer(),
        body:Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text('Adjust Meal Selection',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(child: ListView(
              children: [

               _buildSwitchListTile('Gluten-Free',
               'only include Gluteen-Free',
               _gluteenFree,
               (newValue) {
                 setState(() {
                   _gluteenFree=newValue;
                 });
               }
               ),

              _buildSwitchListTile('Lactose-Free',
               'only include Lactose-Free',
               _lactoseFree,
               (newValue) {
                 setState(() {
                   _lactoseFree=newValue;
                 });
               }
               ),

               _buildSwitchListTile('Vegetarian',
               'only include Vegetarian',
               _vegetarian,
               (newValue) {
                 setState(() {
                   _vegetarian=newValue;
                 });
               }
               ),

               _buildSwitchListTile('Vegan',
               'only include Vegan',
               _vegan,
               (newValue) {
                 setState(() {
                   _vegan=newValue;
                 });
               }
               ),

              ],
            ),)
          ],
        )
    );
  }
}