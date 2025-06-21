import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:utilidades/src/models/about_model.dart';

class AboutController {
  AboutModel getAbout() {
    return AboutModel(
      photoUrl: "https://live.staticflickr.com/2325/2248674208_1f50ea5fc8.jpg",
      aboutMe: [

        "Meu nome é Alexandre, trabalho em farmácia hospitalar há 3 anos"
        "estou em transição para área de tecnologia.",
        
        "Meu objetivo é virar um desenvolvedor flutter",
        
        "meus connhecimentos na área são: "
        "java, dart, flutter, mysql, html, css e git",

      ],
      socialLinks: [
        SocialLinks(
          name: "GitHub",
          icon: FontAwesomeIcons.github,
          color: Colors.black,
          url: "https://github.com/Alexandrep1",
        ),
        SocialLinks(
          name: "Linkedin",
          icon: Icons.link,
          color: Colors.black,
          url: "https://linkedin.com/in/Alexandrep1",
        ),
         SocialLinks(
          name: "Linkedin",
          icon: FontAwesomeIcons.youtube,
          color: Colors.black,
          url: "https://youtube.com/in/babynet1"
        ),
      ],
    );
  }
}