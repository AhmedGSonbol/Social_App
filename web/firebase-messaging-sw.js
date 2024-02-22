importScripts("https://www.gstatic.com/firebasejs/7.15.5/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/7.15.5/firebase-messaging.js");

//Using singleton breaks instantiating messaging()
// App firebase = FirebaseWeb.instance.app;


firebase.initializeApp({
  apiKey: 'AIzaSyC_nJ5Bd1o8L4vaih4AEIJoj5ISXvf8K4w',
  authDomain: 'firstfirebaseproject-304ca.firebaseapp.com',
  databaseURL: 'https://firstfirebaseproject-304ca.firebaseio.com',
  projectId: 'firstfirebaseproject-304ca',
  storageBucket: 'firstfirebaseproject-304ca.appspot.com',
  messagingSenderId: 'sender-id',
  appId: '1:1064068149586:web:f2184d9c36673168f0ca8b',
  measurementId: 'G-XE9R8XSXSQ',
});

const messaging = firebase.messaging();
messaging.setBackgroundMessageHandler(function (payload) {
    const promiseChain = clients
        .matchAll({
            type: "window",
            includeUncontrolled: true
        })
        .then(windowClients => {
            for (let i = 0; i < windowClients.length; i++) {
                const windowClient = windowClients[i];
                windowClient.postMessage(payload);
            }
        })
        .then(() => {
            return registration.showNotification("New Message");
        });
    return promiseChain;
});
self.addEventListener('notificationclick', function (event) {
    console.log('notification received: ', event)
});