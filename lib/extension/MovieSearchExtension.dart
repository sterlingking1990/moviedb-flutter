import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviedb_app/view/mainpage.dart';

extension MovieSearch on MovieAppSinglePageState {
  Widget searchExtension(
      BuildContext context, TextEditingController searchInputController) {
    return Stack(alignment: AlignmentDirectional.centerEnd, children: [
      TextField(
          onChanged: (text) {
            searchMov(text);
          },
          controller: searchInputController,
          decoration: InputDecoration(
              hintText: "Search movie by title",
              contentPadding: EdgeInsets.all(5.0),
              focusColor: Colors.black,
              hoverColor: Colors.black,
              border: InputBorder.none),
          cursorColor: Colors.black),
      MaterialButton(
          onPressed: searchMovie, child: Icon(Icons.search), elevation: 100)
    ]);
  }
}
