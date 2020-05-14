'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "favicon.png": "aba704c41dfa870d512925e2b89a174d",
"assets/FontManifest.json": "8b1e82f4d4b139209dbd88c7f0159940",
"assets/AssetManifest.json": "845d4c6d92f1dc095a3db9c4b8dd88ea",
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
"assets/assets/sounds/disabled.mp3": "a388a176c282e5230f9062722fad0339",
"assets/assets/sounds/click.mp3": "4e2a110a4d929be81b89b2c728f8d51e",
"assets/assets/sounds/swipe.mp3": "9ee5c58f85776e10789d857563c9bbec",
"assets/assets/sounds/toggle.mp3": "07051d59db1634c379327a694e2bb529",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/packages/flutter_markdown/assets/logo.png": "67642a0b80f3d50277c44cde8f450e50",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "2aa350bd2aeab88b601a593f793734c0",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "2bca5ec802e40d3f4b60343e346cedde",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "5a37ae808cf9f652198acde612b5328d",
"main.dart.js": "524c3dfafb294b485e499d47722c24e8",
"icons/Icon-512.png": "80ccaaeef9f443e0b93542f15b159874",
"icons/android.png": "f9175d6d68764298592937b0eaf827db",
"icons/Icon-192.png": "52bfa7adca435aa4108778081b767e6a",
"manifest.json": "a11f5e154916ac16644c939a839c18af",
"index.html": "32f82333506594f9e38d69ff1b2a5872",
"/": "32f82333506594f9e38d69ff1b2a5872"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"/",
"index.html",
"assets/LICENSE",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(CORE);
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');

      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }

      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // If the URL is not the the RESOURCE list, skip the cache.
  if (!RESOURCES[key]) {
    return event.respondWith(fetch(event.request));
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

