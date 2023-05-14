import 'package:flutter/material.dart';
import '/src/src_barrel.dart';

enum PasswordStrength {
  normal,
  weak,
  okay,
  strong,
}

enum FPL {
  email(TextInputType.emailAddress),
  number(TextInputType.number),
  text(TextInputType.text),
  password(TextInputType.visiblePassword),
  multi(TextInputType.multiline, maxLength: 1000, maxLines: 5),
  phone(TextInputType.phone),
  money(TextInputType.number),

  //card details
  cvv(TextInputType.number, maxLength: 4),
  cardNo(TextInputType.number, maxLength: 20),
  dateExpiry(TextInputType.datetime, maxLength: 5);

  final TextInputType textType;
  final int? maxLength, maxLines;

  const FPL(this.textType, {this.maxLength, this.maxLines = 1});
}

enum Service {
  mobile("Mobile App Development", Assets.mobile, 4,
      "Building Mobile apps with Flutter makes for Efficient development for Android and iOS using a single codebase"),
  backend("Backend Development", Assets.backend, 4,
      "My expertise lies in Node.js backend development for building scalable web applications and APIs with efficiency and flexibility."),
  embedded("Embedded Systems", Assets.embedded, 3,
      "Using Arduino, ESP32, and Raspberry Pi, I build smart IoT devices and automate tasks, while gathering data from the physical world, with direct hardware control."),
  blockchain("Blockchain & Web3", Assets.blockchain, 3,
      "With Binance Smart Chain and Solidity, I build secure and transparent blockchain systems for decentralized apps and web3 projects with trustless transactions.");

  final String name, icon, desc;
  final int scale;

  const Service(this.name, this.icon, this.scale, this.desc);
}

enum Projects {
  udrive("Udrive Logistics", Assets.udrive, 2,
      "Udrive logistics is a company that offers comprehensive logistic services through its two apps, one for drivers and the other for riders. The apps provide an extensive range of services such as delivery, errand and ride services, and wallet payments. With Google Maps integration, users can easily track their rides and deliveries. The chat features and notifications ensure timely communication and updates. The apps also offer easy sign-in through Google and Apple credentials. Udrive logistics' referral system rewards customers for bringing new users to the platform. Additionally, the company provides customer care support to ensure a seamless experience for its users."),
  places("Find Places", Assets.places, 2,
      "FindPlaces is a social networking app that uses Google Maps to help users discover new friends. By displaying heat maps of popular locations on the map, users can easily find places where people frequently gather and meet like-minded individuals. The app features Apple Sign and Google Sign for easy onboarding, chat functionality for communication with other users, event creation tools, and the ability to upload and share short videos. With FindPlaces, users can connect with others who share their interests and expand their social circle in a fun and interactive way."),
  swiftvote("SwiftVote", Assets.swiftvote, 2,
      "Swiftvote is an innovative app that offers a new service to the world, Election as a Service. With its cutting-edge blockchain technology, it ensures secure and transparent elections. Currently, it is available for schools, but the company plans to expand its services to organizations and countries. Swiftvote also offers SwiftEd, an educational platform to inform users about election processes and procedures. Additionally, Swiftpoll enables users to take polls on various topics. With its user-friendly interface and advanced security measures, Swiftvote is revolutionizing the election process."),
  sobaz("Sobaz Oil Group", Assets.sobaz, 13,
      "Sobaz Oil Group offers two mobile apps, one for admin and the other for staffs and customers, which enable efficient management of oil deliveries. The app allows admin to calculate ullages and send them to customers, who then verify and send the details back to the admin. Customers receive timely delivery updates through emails, while the admin has access to the history of deliveries, truck charts, and members. The backend system ensures the protection of the different user roles and their data."),
  jimusic("JI Music Player", Assets.jimusic, 1,
      "JI Music Player is a sleek and user-friendly music player app that allows you to play music from your local device. It features various sorting options such as folders, artists, albums, and songs for easy navigation. Additionally, the app comes with playlist, favorites, and most played features, allowing you to manage your music library efficiently. It also has a dark and light mode to suit your preference, and a beautiful now playing screen to enhance your music listening experience"),
  kinesis("AIRVAC", Assets.kinesis, 13,
      "Kinesis is an innovative company that has developed AIRVAC, an Automated Indoor Robot Vacuum Cleaner engineering solution. This state-of-the-art product was built using high-end technology, including the esp32 microcontroller, mpu6050 for direction, ultrasonic and obstacle avoidance sensors for obstacle detection, and a powerful 12v rechargeable battery for power. With features like spot cleaning, no zone cleaning, and full room cleaning, AIRVAC ensures maximum cleaning efficiency. Additionally, the product comes with a user-friendly app that connects to it via Wi-Fi, making it easy to control and monitor the cleaning operations. AIRVAC is an excellent choice for anyone who wants a hassle-free cleaning experience."),
  taams("TAAMS", Assets.taams, 13,
      "TAAMS (TetFund Assisted Attendance Management System) is an innovative Attendance Management System that is designed to help schools and universities take attendance with ease. The system comprises of an app, an admin panel, and a backend that work together seamlessly to ensure that attendance taking is a breeze. With the use of LoRa Technology, TAAMS eliminates the need for costly wifi and makes it possible for attendance to be taken over long distances. The admin panel provides school administrators with the ability to view users, schools, attendances, courses, students, and staff, while the app allows students, lecturers, and guardians to take attendance easily and conveniently. With TAAMS, attendance taking is now more accurate, efficient, and cost-effective."),
  gpslogger("GPS Logger", Assets.gpslogger, 1,
      "GPS Logger is a mobile app that tracks and logs the current location of a user. It sends the location data via Bluetooth to an ESP32 device for storage. This app was developed as an Internet of Things (IoT) solution for research purposes during the design process of TAAMS (Tetfund Assisted Attendance Management System). It helps in keeping track of the user's location and can be useful for a variety of purposes including safety, research, and personal tracking.");

  final String name, icon, desc;
  // final List<String> url;
  final int no;
  const Projects(this.name, this.icon, this.no, this.desc);
}

enum Skills {
  arduino("Arduino", Assets.arduino, 4),
  css3("CSS", Assets.css3, 3),
  dart("Dart", Assets.dart, 5),
  // embeddedc("Embedded-C", Assets.embeddedc, 2),
  express("Express", Assets.express, 4),
  firebase("Firebase", Assets.firebase, 3),
  flutter("Flutter", Assets.flutter, 5),
  github("Github", Assets.github, 5),
  googlecloud("Google Cloud", Assets.googlecloud, 3),
  html5("HTML", Assets.html5, 3),
  java("Java", Assets.java, 3),
  javascript("Javascript", Assets.javascript, 4),
  mysql("MySQL", Assets.mysql, 4),
  nodejs("NodeJS", Assets.nodejssvg, 5),
  python("Python", Assets.python, 3),
  raspberrypi("RaspberryPi", Assets.raspberrypi, 4),
  ruby("Ruby", Assets.ruby, 3),
  sequelize("Sequelize", Assets.sequelize, 4),
  solidity("Solidity", Assets.solidity, 3);

  final String name, icon;
  final int no;
  const Skills(this.name, this.icon, this.no);
}
