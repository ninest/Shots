'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "favicon.png": "aba704c41dfa870d512925e2b89a174d",
"assets/FontManifest.json": "8b1e82f4d4b139209dbd88c7f0159940",
"assets/AssetManifest.json": "d33bb3589ed89862021451dc3be2c43c",
"assets/LICENSE": "6132518c9ef6b3653b4cc353deb61aa7",
"assets/assets/metadata.yml": "20df8c079dfb646ad3f3d31bbb9bbcca",
"assets/assets/packs/nsfw_placeholder.yml": "c4674e3e1f76f42c4bb506b1ffa331eb",
"assets/assets/packs/test.yml": "f9df2a6e1073bd449521c750c92b6a37",
"assets/assets/fonts/Rubik-Medium.ttf": "c87313aa86b7caa31a9a0accaa584970",
"assets/assets/fonts/Rubik-Italic.ttf": "9a5eb2e5a64a12fe3cf7b6436690296a",
"assets/assets/fonts/Rubik-Bold.ttf": "9a6fb6f5cd3aa4ab1adaaab1f693f266",
"assets/assets/fonts/Rubik-Regular.ttf": "b3d0902b533ff4c4f1698a2f96ddabab",
"assets/assets/fonts/Rubik-Light.ttf": "7a06846baf7fd2cfb18c7ab4d663c8ca",
"assets/assets/fonts/Rubik-BoldItalic.ttf": "c002cd789eb43641c98b7817ee26e3e3",
"assets/assets/fonts/Rubik-Black.ttf": "fba2019b0b09731cc334297955971642",
"assets/assets/fonts/Rubik-MediumItalic.ttf": "56583c2363a20436f7448d9b963c0463",
"assets/assets/fonts/Rubik-LightItalic.ttf": "4fd638a635e1b6cbd62a64fc717694fa",
"assets/assets/fonts/Rubik-BlackItalic.ttf": "849377dd9955004ffa915488230047f3",
"assets/assets/icons/android.png": "f9175d6d68764298592937b0eaf827db",
"assets/assets/sounds/success.mp3": "a388a176c282e5230f9062722fad0339",
"assets/assets/sounds/swipe.mp3": "a74f86f5c02b9187c389c143e0e435c5",
"assets/assets/sounds/failure.mp3": "dd60d46023c51899619e1c112436d7bd",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/packages/flutter_markdown/assets/logo.png": "67642a0b80f3d50277c44cde8f450e50",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "2aa350bd2aeab88b601a593f793734c0",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "2bca5ec802e40d3f4b60343e346cedde",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "5a37ae808cf9f652198acde612b5328d",
"main.dart.js": "78a459f9158eb352f3d40480922fbfb5",
"icons/Icon-512.png": "80ccaaeef9f443e0b93542f15b159874",
"icons/android.png": "f9175d6d68764298592937b0eaf827db",
"icons/Icon-192.png": "52bfa7adca435aa4108778081b767e6a",
"manifest.json": "a11f5e154916ac16644c939a839c18af",
"index.html": "32f82333506594f9e38d69ff1b2a5872",
"/": "32f82333506594f9e38d69ff1b2a5872"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
