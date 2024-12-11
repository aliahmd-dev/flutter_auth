import 'package:flutter/material.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ProjectPage()));
                }, 
      child: Container(
        margin: EdgeInsets.all(10),
        height: 70,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text("Project Name")
          ],
        ),
      ),
    );
  }
}