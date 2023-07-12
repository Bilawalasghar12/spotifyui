import 'dart:convert';

import 'package:flutter/material.dart';


gg? photosFromMap(String str) => gg.fromMap(json.decode(str));



class gg {
  gg({
    this.artist,
    this.title,
    this.album,
    this.link,
    this.picture,

  });

  String? artist;
  String? title;
  String? album;
  String? link;
  String? picture;



  factory gg.fromMap(Map<String, dynamic> json) => gg(
    artist: json["artist"],
    title: json["title"],
    album: json["album"],
picture:json["picture"],
  );

  Map<String, dynamic> toMap() => {
    "album": album,
    "title": title,
    "artist": artist,
    "picture" : picture,

  };
}