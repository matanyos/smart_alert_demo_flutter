import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
    const NavigationDrawer({Key? key}) : super(key: key);
   
  
  @override
    Widget build(BuildContext context) 
{
    return Drawer(
    width: 400,
    backgroundColor: const Color.fromARGB(255,26,34,37),
      child:SingleChildScrollView(
        child: Container(
          color:const Color.fromARGB(255,26,34,37) ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeader(context),
              Padding(
                padding: const EdgeInsets.only(top:30),
                 child: buildMenuItems(context))
            ],),
        )));
}
    Widget buildHeader(BuildContext context)
    {
      return Container(
        padding:EdgeInsets.only(top:MediaQuery.of(context).padding.top),
        child: Container(height: 90,color:const Color.fromARGB(255,26,34,37),
        child: Row(
          children: [Padding(
            padding: const EdgeInsets.only(top:20),
            child: Image.asset('assets/logo.png'),
          )]),
      ));
    }
  
    Widget buildMenuItems(BuildContext context)
    {
        return Column(
          children: [
            createMenuItem(title:'MY PROGRESS',icon: Icons.home_max_outlined, onTap: (){}),
            const SizedBox(height: 20),
            createMenuItem(title:'PROFILE',icon: Icons.person,onTap: (){}),
            const SizedBox(height: 20),
            createMenuItem(title:'USERS',icon: Icons.people,onTap: (){}),
            const SizedBox(height: 40),  
            const Divider(color: Colors.white),
            const SizedBox(height: 40),
            createMenuItem(title:'Sync',icon: Icons.sync, onTap: (){}),
            const SizedBox(height: 20),  
            createMenuItem(title:'Support',icon: Icons.support,onTap: (){}),
            const SizedBox(height: 20),  
            createMenuItem(title:'Log out',icon: Icons.logout,onTap: (){}),
          ],
        );
    }

    Padding createMenuItem({required String title, required void Function() onTap, required IconData icon}) {
      return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              leading: Icon(icon, color: Colors.white,size: 35),
              title:  Text(title, style: const TextStyle(fontSize: 22,color: Colors.white)),
              onTap: onTap,),
          );
    }
   
} 
  