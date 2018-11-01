import 'package:flutter/material.dart';
import 'package:online_store/blocs/bloc_provider.dart';
import 'package:online_store/widgets/drawer/menu_item.dart';

class DrawerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of(context).authBloc;
    return new Drawer(
        child: new StreamBuilder(
      stream: authBloc.auth,
      builder: (context, snapshot) {
        return Container(
            color: Colors.green,
            child: new Column(
              children: <Widget>[
                new Expanded(
                  child: new Container(
                    padding: EdgeInsets.only(top: 40.0),
                    child: new Column(
                      children: <Widget>[
                        new Container(
                            decoration: new BoxDecoration(
                                color: Colors.transparent,
                                border: new Border.all(
                                    color: Colors.redAccent, width: 2.0),
                                borderRadius: new BorderRadius.circular(100.0)),
                            child: new Container(
                              width: 100.0,
                              height: 100.0,
                              padding: EdgeInsets.all(5.0),
                              child: snapshot.data['isAuth'] == true
                                  ? new CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://media.licdn.com/dms/image/C4D03AQH7JI67WE1hAw/profile-displayphoto-shrink_100_100/0?e=1544054400&v=beta&t=ymDXIFJA0lOEi2unXPMDDHhb6NlC23B5cXSkH_Wqenw'),
                                    )
                                  : new CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdI4vX5gRoNdDDDrrSgPxSWBh4LWcu-HMsX87IomFM_o2Xq4iD1Q')),
                            )),

                        snapshot.data['isAuth'] == true ? new Text(
                          snapshot.data['user']['name'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.white),
                        ):
                        FlatButton(
                          child: Text('ورود'),
                          onPressed: (){Navigator.of(context).pushNamed('/login');},
                        )
                        ,
                        snapshot.data['isAuth'] == true ? new Text(
                          snapshot.data['user']['title'],
                          style: TextStyle(color: Colors.white),
                        ):new Container(),
                      ],
                    ),
                  ),
                ),
                new Expanded(
                  flex: 2,
                  child: new Container(
                    color: Colors.white,
                    child: new Column(
                      children: <Widget>[
                        snapshot.data['isAuth'] == false ?
                        new MenuItem(
                          title: "ورود",
                          icon: Icon(
                            Icons.person,
                            color: Colors.black54,
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('/login');
                          },
                        ):
                        new MenuItem(
                          title: "خروج",
                          icon: Icon(
                            Icons.exit_to_app,
                            color: Colors.black54,
                          ),
                          onTap: () {
                            authBloc.logout.add('logout');
                          },
                        )
                        ,
                        new MenuItem(
                          title: "خانه",
                          icon: Icon(
                            Icons.home,
                            color: Colors.black54,
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('/home');
                          },
                        ),
                        new MenuItem(
                          title: "سبد خرید",
                          icon: Icon(
                            Icons.shopping_basket,
                            color: Colors.black54,
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('/cart');
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ));
      },
    ));
  }
}
