import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'modelclass.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  bool? get isFavourite => null;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final bool isFavourite;
  late final Function(bool) onChanged;
  bool _isFavourite = false;
  bool _isnotFavourite = false;

  //  FlutterAudioQuery a
  AudioPlayer audioPlayer = AudioPlayer();

  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  String songLink =
      'https://firebasestorage.googleapis.com/v0/b/guardpass-810e3.appspot.com/o/waterfall-140894.mp3?alt=media&token=8e6242fc-3425-45ce-899e-6d373748a30b';

  List<gg> items = [
    gg(
        artist: 'Artist',
        album: 'Album',
        title: 'Title',
        link:
            'https://firebasestorage.googleapis.com/v0/b/guardpass-810e3.appspot.com/o/waterfall-140894.mp3?alt=media&token=8e6242fc-3425-45ce-899e-6d373748a30b'),
    gg(
        artist: 'The Weeknd',
        album: 'After Hours',
        title: 'Starboy',
        link:
            'https://firebasestorage.googleapis.com/v0/b/billu-music.appspot.com/o/soun1.mp3?alt=media&token=df3f08f5-dc42-4b7f-911d-4dca3250f60f',
        picture: 'https://i.redd.it/pb6q1gcffqk91.jpg'),
    gg(
        artist: 'The weeknd',
        album: 'After Hours',
        title: 'Snowchild',
        link:
            'https://firebasestorage.googleapis.com/v0/b/billu-music.appspot.com/o/The%20Weeknd%20-%20Snowchild%20(Animated%20Video).mp3?alt=media&token=16aa6971-b426-4244-8d18-59fb5f269eae',
        picture:
            'https://m.media-amazon.com/images/M/MV5BYjdkYjhjN2UtYTkzMi00NTVkLWFkNmUtMzFhZWUwZTZiMTMwXkEyXkFqcGdeQXVyNDU1NDIzMzY@._V1_.jpg'),
    gg(
        artist: 'Drake',
        album: 'Nonstop',
        title: 'nonstop',
        link:
        'https://firebasestorage.googleapis.com/v0/b/billu-music.appspot.com/o/Drake%20-%20Nonstop.mp3?alt=media&token=8374686b-a919-474b-9f7b-72617d5025f7',
      picture: 'https://w0.peakpx.com/wallpaper/810/870/HD-wallpaper-drake-canadian-rapper-concert-music-stars-aubrey-drake-graham-drake-with-microphone-violet-neon-ligns-creative-drake.jpg'


    ),
    gg(
        artist: 'The Weeknd',
        album: 'After Hours',
        title: 'AfterHours',
        link: 'https://firebasestorage.googleapis.com/v0/b/billu-music.appspot.com/o/The%20Weeknd%20-%20After%20Hours%20(Audio).mp3?alt=media&token=17d401f8-6d17-4530-9a7c-99270b954212',
    picture: 'https://i.redd.it/b8swt9g9qme61.png'),
    gg(
        artist: 'The weeknd',
        album: 'After Hours',
        title: 'Die for you',
        link:'https://firebasestorage.googleapis.com/v0/b/billu-music.appspot.com/o/The%20Weeknd%20-%20DIE%20FOR%20YOU%20(Lyrics).mp3?alt=media&token=635877fa-d0e4-496c-8b24-7bce5c75fcaa',
    picture: 'https://i.ebayimg.com/images/g/UowAAOSw4cdgUysp/s-l1600.png'),
    gg(
        artist: 'The Weeknd',
        album: 'After Hours',
        title: 'Blinding Lights',
        link:
            'https://firebasestorage.googleapis.com/v0/b/billu-music.appspot.com/o/The%20Weeknd%20-%20Blinding%20Lights%20(Official%20Video).mp3?alt=media&token=a9126f5e-8dea-4500-b927-4555dab46ab8',
    picture: 'https://mir-s3-cdn-cf.behance.net/projects/404/ba570595077887.Y3JvcCw4NjMsNjc1LDM0OCwzMjA.jpg'),
    gg(
        artist: 'The weeknd',
        album: 'life',
        title: 'Low life',
        link: 'https://firebasestorage.googleapis.com/v0/b/billu-music.appspot.com/o/Future%20-%20Low%20Life%20(Official%20Music%20Video)%20ft.%20The%20Weeknd.mp3?alt=media&token=f201bdfc-ffae-458d-86d1-b1a91a72744e',
    picture: 'https://e0.pxfuel.com/wallpapers/474/807/desktop-wallpaper-young-thug-the-weeknd-in-2020-abel-the-weeknd-young-thug-the-weeknd-young-thug-future.jpg'),
    gg(
        artist: 'Talha Anjum',
        album: 'Open Letter',
        title: 'Flex',
        picture: 'https://preview.redd.it/talha-anjums-upcoming-album-cover-recreated-credit-u-oye-v0-aev9cqsnjbia1.jpg?auto=webp&s=34c0e5af979cb0d1fe998012d670ad09ca0b724a',
        link:
        'https://firebasestorage.googleapis.com/v0/b/billu-music.appspot.com/o/Talha%20Anjum%20-%20Flex%20_%20Prod.%20by%20UMAIR%20(Official%20Audio).mp3?alt=media&token=0413cfd2-76eb-4e85-906b-2a2a883bfeac'),
    gg(
        artist: 'Talha Anjum',
        album: 'Open Letter',
        title: 'Melancholy',
        picture: 'https://preview.redd.it/talha-anjums-upcoming-album-cover-recreated-credit-u-oye-v0-aev9cqsnjbia1.jpg?auto=webp&s=34c0e5af979cb0d1fe998012d670ad09ca0b724a',
        link:
            'https://firebasestorage.googleapis.com/v0/b/billu-music.appspot.com/o/Talha%20Anjum%20-%20Melancholy%20_%20Intro%20_%20Prod.%20by%20UMAIR%20(Official%20Audio).mp3?alt=media&token=72e0e052-4733-49ff-bb71-cbfc2017af8b'),
    gg(
        artist: 'Drake',
        album: 'Key Glock',
        title: 'Ambition for cash',
        picture: 'https://i.ytimg.com/vi/tdUryRgD674/maxresdefault.jpg',
        link:
            'https://firebasestorage.googleapis.com/v0/b/billu-music.appspot.com/o/Key%20Glock%20-%20Ambition%20For%20Cash%20(Audio).mp3?alt=media&token=b3fd45da-64cb-4751-95b5-c1a189a9e359'),
    gg(
        artist: 'MC STAN',
        album: 'Open Letter',
        title: 'Ek din pyar',
        picture: 'https://i.ytimg.com/vi/gU74mNz64VU/maxresdefault.jpg',
        link:
            'https://firebasestorage.googleapis.com/v0/b/billu-music.appspot.com/o/Ek%20Din%20Pyar%20_%20Slowed%20N%20Reverb%20_%20MC%20STAN%20%E2%9C%A8.mp3?alt=media&token=6ea35bdf-9a50-4aaa-ad11-13b45f5855d3'),
    gg(
        artist: 'Talha Anjum',
        album: 'Open Letter',
        title: 'Studio Gangsters',
        picture: 'https://preview.redd.it/talha-anjums-upcoming-album-cover-recreated-credit-u-oye-v0-aev9cqsnjbia1.jpg?auto=webp&s=34c0e5af979cb0d1fe998012d670ad09ca0b724a',
        link:
            'https://firebasestorage.googleapis.com/v0/b/billu-music.appspot.com/o/Talha%20Anjum%20-%20Studio%20Gangsters%20feat.%20Rap%20Demon%20_%20Prod.%20by%20UMAIR%20%26%20superdupersultan%20(Official%20Audio).mp3?alt=media&token=3806abf7-f1e1-4f16-aa6d-941eda774c9f'),
    gg(
        artist: 'Talha Anjum',
        album: 'Open Letter',
        title: 'Happy Hours',
        picture: 'https://preview.redd.it/talha-anjums-upcoming-album-cover-recreated-credit-u-oye-v0-aev9cqsnjbia1.jpg?auto=webp&s=34c0e5af979cb0d1fe998012d670ad09ca0b724a',
        link:
            'https://firebasestorage.googleapis.com/v0/b/billu-music.appspot.com/o/Talha%20Anjum%20-%20Happy%20Hour%20_%20Prod.%20by%20Jokhay%20(Official%20Audio).mp3?alt=media&token=3c435745-db6c-4915-8f79-7054c8f1aa57'),
    gg(
        artist: 'Talha Anjum',
        album: 'Open Letter',
        title: 'Touch Base',
        picture: 'https://preview.redd.it/talha-anjums-upcoming-album-cover-recreated-credit-u-oye-v0-aev9cqsnjbia1.jpg?auto=webp&s=34c0e5af979cb0d1fe998012d670ad09ca0b724a',
        link:
            'https://firebasestorage.googleapis.com/v0/b/billu-music.appspot.com/o/Talha%20Anjum%20-%20Touch%20Base%20feat.%20Talhah%20Yunus%20%26%20KR%24NA%20_%20Prod.%20by%20UMAIR%20(Official%20Audio).mp3?alt=media&token=bb52c2a6-7698-4265-a0ee-c455ca85ae8b'),
    gg(
        artist: 'Sidhu Mossewala',
        album: 'Mossewala Tape',
        title: '295',
        picture: 'https://c.saavncdn.com/609/Moosetape-Punjabi-2021-20220427043323-500x500.jpg',
        link:
            'https://firebasestorage.googleapis.com/v0/b/billu-music.appspot.com/o/295%20(Official%20Audio)%20_%20Sidhu%20Moose%20Wala%20_%20The%20Kidd%20_%20Moosetape.mp3?alt=media&token=ad2ffb57-40a5-489d-8b7b-75f153334adf'),
    gg(
        artist: 'Sidhu Mossewala',
        album: 'Mossewala Tape',
        title: 'Last Ride',
        picture: 'https://images.genius.com/b8f7bc545338018032bc185e9de08d77.1000x1000x1.jpg',
        link:
            'https://firebasestorage.googleapis.com/v0/b/billu-music.appspot.com/o/THE%20LAST%20RIDE%20-%20Offical%20Video%20_%20%20Sidhu%20Moose%20Wala%20_%20Wazir%20Patar.mp3?alt=media&token=705608b6-e9a7-4f64-a12e-256e7d9275f7'),
    gg(
        artist: 'Talha Anjum',
        album: 'Open Letter',
        title: 'Agency',
        picture: 'https://preview.redd.it/talha-anjums-upcoming-album-cover-recreated-credit-u-oye-v0-aev9cqsnjbia1.jpg?auto=webp&s=34c0e5af979cb0d1fe998012d670ad09ca0b724a',
        link:
            'https://firebasestorage.googleapis.com/v0/b/billu-music.appspot.com/o/Agency%20-%20Talha%20Anjum%20_%20Rap%20Demon%20_%20Prod.%20by%20UMAIR%20(Official%20Lyric%20Video).mp3?alt=media&token=f2e63380-b22a-413e-b793-ccae4c948b6e'),
    gg(
        artist: 'Talha Anjum',
        album: 'Open letter',
        title: '12 baje',
        picture: 'https://preview.redd.it/talha-anjums-upcoming-album-cover-recreated-credit-u-oye-v0-aev9cqsnjbia1.jpg?auto=webp&s=34c0e5af979cb0d1fe998012d670ad09ca0b724a',
        link:
            'https://firebasestorage.googleapis.com/v0/b/billu-music.appspot.com/o/12%20BAJAY%20-%20Talha%20Anjum%20_%20Rap%20Demon%20_%20Talhah%20Yunus%20_%20(Prod.%20by%20Rovalio).mp3?alt=media&token=96ddfca0-8149-4620-91e5-84de2af7b21f'),
    gg(
        artist: 'Bohemia',
        album: 'Kali Denali',
        picture: 'https://media.lyricsmint.com/photos/6407/bohemia-rap-song-gumrah_cover.jpg',
        title: 'Gunegaar',
        link:
            'https://firebasestorage.googleapis.com/v0/b/billu-music.appspot.com/o/BOHEMIA%20-%20Gunagaar%20(Official%20Audio)%20%20Punjabi%20Songs.mp3?alt=media&token=9ce050cd-2ee0-46eb-bce6-d453649118ca'),
  ];

  gg item = gg();

  @override
  void initState() {
    super.initState();
    item = items[1];
    getMp3Duration(songLink);
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        print(state);
        print(isPlaying);
        print(state == PlayerState.playing);
        isPlaying = state == PlayerState.playing;
        _isFavourite = widget.isFavourite ?? false;
        //      _isnotFavourite = widget.isFavourite!;
      });
    });

    // audioPlayer.onPlayerStateChanged.listen((state) {
    //   setState(() {
    //     isPlaying = state == PlayerState.PLAYING;
    //   });
    // });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 88
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 13,
                    ),
                    // Image.asset(
                    //   'assets/3af0e55ea66ea69e35145fb108b4a636.jpg',
                    //   fit: BoxFit.cover,
                    //   height: 200.00,
                    //   width: 190.00,
                    // ),
                    Image.network(
                      item.picture.toString(),
                      fit: BoxFit.cover,
                      height: 200.00,
                      width: 190.00,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [SizedBox(height: 15,),
                            Text(
                              'Hip/Hop Playlist',
                             //maxLines: 4,
                              style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title.toString(),
                                    maxLines: 1,
                                    style:
                                    GoogleFonts.lato(

                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,


                                    ),
                                  ),
                                  //   TextStyle(
                                  //       fontSize: 25,
                                  //
                                  //       color: Colors.white,
                                  //       fontWeight: FontWeight.bold),
                                  // ),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  Text(
                                    item.artist.toString(),
                                    maxLines: 4,

                                    style: GoogleFonts.lato(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    item.album.toString(),
                                    maxLines: 4,

                                      style: GoogleFonts.lato(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                      ),
                                  ),
                                ],
                              ),
                            ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            //
                            // Text(
                            //   item.artist.toString(),
                            //   maxLines: 4,
                            //   style: TextStyle(
                            //       fontSize: 25,
                            //       color: Colors.white,
                            //       fontWeight: FontWeight.bold),
                            // ),
                            // SizedBox(height: 10,),
                            // Text(
                            //   item.album.toString(),
                            //   maxLines: 4,
                            //   style: TextStyle(
                            //       fontSize: 25,
                            //       color: Colors.white,
                            //       fontWeight: FontWeight.bold),
                            // ),

                            // Text(
                            //   'Created by lofi girl 18 songs, 28 mins ',
                            //   maxLines: 4,
                            //   style: TextStyle(
                            //       fontSize: 25,
                            //       color: Colors.white,
                            //       fontWeight: FontWeight.bold),
                            // )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 7,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 17.0,
                          horizontal: 46.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        backgroundColor: Colors.green,
                        primary: Theme.of(context).iconTheme.color,
                        textStyle: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontSize: 12.0, letterSpacing: 2.0),
                      ),
                      onPressed: () async {
                        if (isPlaying) {
                          await audioPlayer.pause();
                          isPlaying = false;
                        } else {
                          String url =
                              'https://firebasestorage.googleapis.com/v0/b/billu-music.appspot.com/o/Key%20Glock%20-%20Ambition%20For%20Cash%20(Audio).mp3?alt=media&token=b3fd45da-64cb-4751-95b5-c1a189a9e359';

                          // 'https://firebasestorage.googleapis.com/v0/b/guardpass-810e3.appspot.com/o/waterfall-140894.mp3?alt=media&token=8e6242fc-3425-45ce-899e-6d373748a30b';
                          await audioPlayer.play(UrlSource(url));
                        }
                        audioPlayer.onDurationChanged.listen((newDuration) {
                          print(newDuration);

                          setState(() {
                            duration = newDuration;
                          });
                        }, onError: (s) {
                          print("Error");
                        });
                      },
                      child: const Text('PLAY'),
                    ),
                    const SizedBox(width: 8.0),
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: _isFavourite ? Colors.red : Colors.white70,
                      ),
                      iconSize: 30.0,
                      onPressed: () {
                        setState(() {
                          _isFavourite = !_isFavourite;
                        });
                        // widget.onChanged(_isFavourite);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_horiz),
                      iconSize: 30.0,
                      onPressed: () {},
                    ),
                    //const Spacer(),
                    // SizedBox(
                    //   width: 80,
                    // ),
                    Spacer(),
                    Text(
                      'FOLLOWERS',
                      style: Theme.of(context)
                          .textTheme
                          .overline!
                          .copyWith(fontSize: 12.0),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                for (int i = 0; i < items.length; i++) ...[
                  GestureDetector(
                    onTap: () async {
                      item = items[i];

                      print(isPlaying);
                      if (isPlaying) {
                        await audioPlayer.stop();
                      }
                      String urlll = items[i].link!;
                      await audioPlayer.play(UrlSource(urlll));

                      audioPlayer.onDurationChanged.listen((newDuration) {
                        print(newDuration);

                        setState(() {
                          duration = newDuration;
                        });
                      }, onError: (s) {
                        print("Error");
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Text(
                              items[i].artist.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            )),
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: Text(items[i].title.toString(),
                                  style:
                                  TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: Text(items[i].album.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ),
                          ]),
                    ),
                  ),
                  const Divider(
                    thickness: 9
                    ,
                  ),
                ],

                // ListView.separated(
                //   itemCount: items.length,
                //   shrinkWrap: true,
                //   separatorBuilder: (BuildContext context, int index) =>
                //   const Divider(
                //     thickness: 1,
                //   ),
                //   itemBuilder: (BuildContext context, int index) {
                //     return Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                //       // crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(items[index].title.toString()),
                //         Text(items[index].artist.toString()),
                //         Text(items[index].album.toString()),
                //
                //
                //       ],
                //     );
                //
                //   },
                // )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
                //color: Color(0xFFa83789),
              color: //Colors.purple.shade400,
              Color(0xFFFF0000),


                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.favorite_border_rounded,
                        color: _isnotFavourite ? Colors.red : Colors.white,
                      ),
                      iconSize: 30.0,
                      onPressed: () {
                        setState(() {
                          _isnotFavourite = !_isnotFavourite;
                        });
                        // widget.onChanged(_isFavourite);
                      },
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () async {
                          if (isPlaying) {
                            await audioPlayer.pause();
                          } else {
                            String url =
                                'https://firebasestorage.googleapis.com/v0/b/billu-music.appspot.com/o/soun1.mp3?alt=media&token=df3f08f5-dc42-4b7f-911d-4dca3250f60f'; // 'https://firebasestorage.googleapis.com/v0/b/guardpass-810e3.appspot.com/o/waterfall-140894.mp3?alt=media&token=8e6242fc-3425-45ce-899e-6d373748a30b';

                           // audioPlayer.setSourceUrl(url);
                            await audioPlayer.play(UrlSource(url)); // will immediately start playing
                          }
                          audioPlayer.onDurationChanged.listen((newDuration) {
                            print(newDuration);

                            setState(() {
                              duration = newDuration;
                            });
                          }, onError: (s) {
                            print("Error");
                          });
                        },
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          size: 30,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )),
                    IconButton(
                      onPressed: () {
                        items.shuffle();
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.shuffle,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  child: Slider(
                    activeColor: Colors.red.shade400,
                    inactiveColor: Colors.white,
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    onChanged: (value) {
                      final position = Duration(seconds: value.toInt());
                      audioPlayer.seek(position);
                      audioPlayer.resume();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<Duration?> getMp3Duration(String url) async {
    final audioPlayer = AudioPlayer();

    final result = await audioPlayer.setSourceUrl(url);


      audioPlayer.getDuration().then((duration) {
        Duration d = Duration(milliseconds: duration!.inMilliseconds);
        print("Seconds: ${d.inSeconds}");
      });
  }
}
