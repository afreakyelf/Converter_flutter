import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:first_flutter/converter_route.dart';
import 'package:first_flutter/unit.dart';

final _borderRadius = BorderRadius.circular(50.0);

class Category extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final IconData iconLocation;
  final List<Unit> units;

  const Category(
      {Key key,
      @required this.name,
      @required this.color,
      @required this.iconLocation,
      @required this.units,
      })
      : assert(name != null),
        assert(color != null),
        assert(iconLocation != null),
        assert(units != null),
        super(key: key);

  void _navigateToConverter(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context){
        return Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            title: Text(
              name,
              style: Theme.of(context).textTheme.display1,
            ),
            centerTitle: true,
            backgroundColor: color,
          ),
          body: ConverterRoute(name: name, color: color, units: units),
        );
      },
    ));
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.transparent,
      child: Container(
        height: 100.0,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: color['highlights'],
          splashColor: color['splash'],
          onTap: () => _navigateToConverter(context),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Icon(
                      iconLocation,
                      size: 60.0,
                    ),
                ),
                Center(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
