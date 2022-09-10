import 'package:flutter/material.dart';

List<Shadow> shadowSmall() {
  return [
    const Shadow(
        // bottomLeft
        offset: Offset(-1, -1),
        color: Colors.black),
    const Shadow(
        // bottomRight
        offset: Offset(1, -1),
        color: Colors.black),
    const Shadow(
        // topRight
        offset: Offset(1, 1),
        color: Colors.black),
    const Shadow(
        // topLeft
        offset: Offset(-1, 1),
        color: Colors.black),
  ];
}

List<Shadow> shadowBig() {
  return [
    const Shadow(
        // bottomLeft
        offset: Offset(-1, -1),
        color: Colors.black),
    const Shadow(
        // bottomRight
        offset: Offset(1, -1),
        color: Colors.black),
    const Shadow(
        // topRight
        offset: Offset(1, 1),
        color: Colors.black),
    const Shadow(
        // topLeft
        offset: Offset(-1, 1),
        color: Colors.black),
  ];
}
