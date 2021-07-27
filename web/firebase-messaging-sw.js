console.log("firebase-messaging-sw.js is called")

importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-messaging.js");

firebase.initializeApp({
  apiKey: "AIzaSyAKJ6eEXLl039Ta9les33IBpTUMpAuv0KA",
  authDomain: "sibunda-718c1.firebaseapp.com",
  projectId: "sibunda-718c1",
  storageBucket: "sibunda-718c1.appspot.com",
  messagingSenderId: "1028319191005",
  appId: "1:1028319191005:web:bbb0ef6172d768dd0c6034",
  measurementId: "G-46NGZ9YS6J"
});
// Necessary to receive background messages:
const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((m) => {
  console.log("onBackgroundMessage", m);
});