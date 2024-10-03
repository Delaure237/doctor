
// ignore_for_file: unused_local_variable, avoid_print

import 'dart:developer';
import 'dart:convert'; 
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'remote_view.dart';

const appId = "45bc19e421734678948ee36071b0fc6f"; 
const tokenUrl = "http://localhost:3015/generate-token";

//const tk ="007eJxTYHCbpdVyMp99UbVlz9YjUp3cz3zNGDbNSlBUeJd+2i2YcacCg4lpUrKhZaqJkaG5sYmZuYWliUVqqrGZgblhkkFaslnark1f0hoCGRn439QyMTJAIIjPy1CSkRpckJqcmZiTWVzCwAAAyhQhZQ==";
class VideoCallPage extends StatefulWidget {
  final String otherUserId; 
  final String receiverName;
  final String appointmentId;
  final DateTime appointmentDate; 
  final TimeOfDay appointmentTime;

  const VideoCallPage({
    super.key,
    required this.otherUserId,
    required this.appointmentId,
    required this.appointmentDate,
    required this.appointmentTime, required this.receiverName,
  });

  @override
  State<VideoCallPage> createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {
  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;
  late String token;

  @override
  void initState() {
    super.initState();
    initAgora();
generateToken(widget.appointmentId, widget.appointmentDate,widget.appointmentTime);
  }

  Future<void> initAgora() async {
    // Demander les permissions pour la caméra et le microphone
    await [Permission.microphone, Permission.camera].request();

    // Créer le moteur Agora
    _engine = createAgoraRtcEngine();

    // Initialiser RtcEngine
    await _engine.initialize(
      const RtcEngineContext(appId: appId),
    );

    // Récupérer l'ID de l'utilisateur connecté
    String currentUserId = FirebaseAuth.instance.currentUser!.uid;

    // Générer le nom du canal
    String channelName = generateChannelName(currentUserId, widget.otherUserId);

    // Générer un token en appelant l'API
    token = await generateToken(widget.appointmentId, widget.appointmentDate,widget.appointmentTime);

    // Enregistrement des événements
    _engine.registerEventHandler(RtcEngineEventHandler(
      onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
        setState(() {
          _localUserJoined = true;
        });
      },
      onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
        setState(() {
          _remoteUid = remoteUid;
        });
      },
      onUserOffline: (RtcConnection connection, int remoteUid, UserOfflineReasonType reason) {
        setState(() {
          _remoteUid = null;
        });
      },
    ));

    // Joindre le canal
    await _engine.joinChannel(
      token: token,
      channelId: widget.appointmentId,
      options: const ChannelMediaOptions(
        autoSubscribeVideo: true,
        autoSubscribeAudio: true,
        publishCameraTrack: true,
        publishMicrophoneTrack: true,
        clientRoleType: ClientRoleType.clientRoleBroadcaster,
      ),
      uid: 0,
    );
  }

  Future<String> generateToken(String appointmentId, DateTime appointmentDate, TimeOfDay appointmentTime) async {
    const String url = tokenUrl; // URL de votre backend

    // Créer le corps de la requête
    final Map<String, dynamic> body = {
      'appointmentId': appointmentId,
      'appointmentDate': appointmentDate.toIso8601String(), // Optionnel
      'appointmentTime': appointmentTime.toString()
      //s de la requête
    };

    // Effectuer l'appel POST à l'API
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    // Vérifier la réponse
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      String receivedToken = responseData['token'];
      print("Token reçu : $receivedToken"); 
      return responseData['token'];
    } else {
        print("Echec!!!!!");
      throw Exception('Échec de la génération du token: ${response.body}');
    
    }
}


  @override
  void dispose() {
    super.dispose();
    _dispose();
  }

  Future<void> _dispose() async {
    await _engine.leaveChannel();
    await _engine.release();
  }

  String generateChannelName(String currentUserId, String otherUserId) {
    List<String> ids = [currentUserId, otherUserId];
    ids.sort();
    log(ids.join('_'));
    return ids.join('_');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appel Vidéo'),
      ),
      body: Stack(
        children: [
          Center(child: _remoteVideo()),
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 100,
              height: 150,
              child: Center(
                child: _localUserJoined
                    ? AgoraVideoView(
                        controller: VideoViewController(
                          rtcEngine: _engine,
                          canvas: const VideoCanvas(uid: 0),
                        ),
                      )
                    : const CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: _remoteUid),
          connection:    RtcConnection(channelId: widget.appointmentId )/* generateChannelName(
              FirebaseAuth.instance.currentUser!.uid, widget.otherUserId)*/
        ),
      );
    } else {
      return RemoteCallView(userName: widget.receiverName, userImage: '',);
    }
  }
}

/*import 'dart:async';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'remote_view.dart'; 

const appId = "45bc19e421734678948ee36071b0fc6f"; 
const token ="007eJxTYHCbpdVyMp99UbVlz9YjUp3cz3zNGDbNSlBUeJd+2i2YcacCg4lpUrKhZaqJkaG5sYmZuYWliUVqqrGZgblhkkFaslnark1f0hoCGRn439QyMTJAIIjPy1CSkRpckJqcmZiTWVzCwAAAyhQhZQ==";
const channel = "theSpecialist";
class VideoCallPage extends StatefulWidget {
  final String otherUserId; // ID de l'autre utilisateur

  const VideoCallPage({super.key, required this.otherUserId});
llk^ùùhuy
  @override
  State<VideoCallPage> createState() => _MyAppState();
}

class _MyAppState extends State<VideoCallPage> {
  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  // Fonction pour générer un nom de canal unique basé sur les deux IDs
  String generateChannelName(String currentUserId, String otherUserId) {
    List<String> ids = [currentUserId, otherUserId];
    ids.sort(); // On trie les IDs pour garantir un nom unique quel que soit l'initiateur
    return ids.join('_'); // Concaténation avec un underscore
  }

  Future<void> initAgora() async {
    // Demander les permissions pour la caméra et le microphone
    await [Permission.microphone, Permission.camera].request();

    // Créer le moteur Agora
   // Create RtcEngine instance
_engine = createAgoraRtcEngine();

// Initialize RtcEngine and set the channel profile to communication
await _engine.initialize(const RtcEngineContext(
    appId: appId,
    channelProfile: ChannelProfileType.channelProfileCommunication,
));

    // Récupérer l'ID de l'utilisateur connecté (courant)
    String currentUserId = FirebaseAuth.instance.currentUser!.uid;

    // Générer le nom du canal avec les deux IDs
    String channelName = generateChannelName(currentUserId, widget.otherUserId);

 // Add an event handler
_engine.registerEventHandler(
    RtcEngineEventHandler(
    // Occurs when the local user joins the channel successfully
    onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
        debugPrint("local user ${connection.localUid} joined");
        setState(() {
        _localUserJoined = true;
        });
    },
    // Occurs when a remote user join the channel
    onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
        debugPrint("remote user $remoteUid joined");
        setState(() {
        _remoteUid = remoteUid;
        });
    },
    // Occurs when a remote user leaves the channel
    onUserOffline: (RtcConnection connection, int remoteUid,
        UserOfflineReasonType reason) {
        debugPrint("remote user $remoteUid left channel");
        setState(() {
        _remoteUid = null;
        });
    },
    ),
);


    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _engine.enableVideo();
    await _engine.startPreview();

    // Rejoindre le canal avec le nom généré
 await _engine.joinChannel(
    // Join a channel using a temporary token and channel name
    token: token,
    channelId:channel,
      options: const ChannelMediaOptions(
        // Automatically subscribe to all video streams
        autoSubscribeVideo: true,
        // Automatically subscribe to all audio streams
        autoSubscribeAudio: true,
        // Publish camera video 
        publishCameraTrack: true,
        // Publish microphone audio 
        publishMicrophoneTrack: true,
        // Set user role to clientRoleBroadcaster (broadcaster) or clientRoleAudience (audience)
        clientRoleType: ClientRoleType.clientRoleBroadcaster),
      uid: 0, // When you set uid to 0, a user name is randomly generated by the engine
);

  }

  @override
  void dispose() {
    super.dispose();
    _dispose();
  }

  Future<void> _dispose() async {
    await _engine.leaveChannel();
    await _engine.release();
  }
  // Add an event handler


  // Création de l'interface utilisateur avec vue locale et distante
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agora Video Call'),
      ),
      body: Stack(
        children: [
          Center(
            child: _remoteVideo(),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 100,
              height: 150,
              child: Center(
                child: _localUserJoined
                    ? AgoraVideoView(
                        controller: VideoViewController(
                          rtcEngine: _engine,
                          canvas: const VideoCanvas(uid: 0),
                        ),
                      )
                    : const CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Afficher la vidéo de l'utilisateur distant
  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: _remoteUid),
          connection: const RtcConnection(channelId: channel),
        ),
      );
    } else {
      return  RemoteCallView(userName: 'mother fuck', userImage: '',);
      
    }
  }
}*/

