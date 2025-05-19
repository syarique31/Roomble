'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "81d4c232f76295a9996ef6a9e87ae718",
"version.json": "ec286772d3050700be74e220fb12bfa8",
"index.html": "21a0aa5d29f4b0237e8b5a491ea52a56",
"/": "21a0aa5d29f4b0237e8b5a491ea52a56",
"main.dart.js": "8deaae853c6d633130fbfb1c5334d648",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "3341e438a702a85b7cba47681866071f",
".git/config": "100739bcccc859deb3d2d57253ad9d6d",
".git/objects/0d/87c6eebb14029d96634cebc0f5b3e034fb9a9b": "a699db2bdd7c447ecdb46d5beaaf8cb0",
".git/objects/68/c19b48232b63c1ead7e9ec5f69bd343789efef": "28579408379b3c0d2d32fe1e6cd960f6",
".git/objects/57/7946daf6467a3f0a883583abfb8f1e57c86b54": "846aff8094feabe0db132052fd10f62a",
".git/objects/03/2fe904174b32b7135766696dd37e9a95c1b4fd": "80ba3eb567ab1b2327a13096a62dd17e",
".git/objects/35/96d08a5b8c249a9ff1eb36682aee2a23e61bac": "e931dda039902c600d4ba7d954ff090f",
".git/objects/58/e6474eec8b0fc8b3ce59d6d3dc02b73627ea82": "36dc7a253aa9babdca38bad3a27a7ece",
".git/objects/67/5d0a12cebe8c9d997a7cc7b3b537cd2f2c4807": "9b070cb71bf5379dcc2bca5916e6e647",
".git/objects/0e/214b777b8c3eef7c52c02623e1f56caef4a993": "cec99519bec4060ade7d5d39983494bc",
".git/objects/5a/8de5abc1aebde14157452a79a78816e0f89a9e": "823fe3e242c38ec8852fe1b6a160360c",
".git/objects/5f/bf1f5ee49ba64ffa8e24e19c0231e22add1631": "f19d414bb2afb15ab9eb762fd11311d6",
".git/objects/d9/3952e90f26e65356f31c60fc394efb26313167": "1401847c6f090e48e83740a00be1c303",
".git/objects/bb/36ca7bdae9c89a80f7353c2327913d27937621": "62cf787f8e4aea9e224ec429e1a899a5",
".git/objects/d7/7cfefdbe249b8bf90ce8244ed8fc1732fe8f73": "9c0876641083076714600718b0dab097",
".git/objects/b3/dacbc152f39e75775f818f54774d8babd962ec": "6c692a71a893f4947d0e75b47e2d6c8d",
".git/objects/b3/73d76e13367da9c01a94d35761390dbb3e69c1": "5e1455506aedbf5bd295f6e393b54e06",
".git/objects/a2/a4e5dc48824828523d651c6c75ae3713d3b32f": "512c664959faad5942fe1173ee44a951",
".git/objects/a5/de584f4d25ef8aace1c5a0c190c3b31639895b": "9fbbb0db1824af504c56e5d959e1cdff",
".git/objects/bd/6be43d015a2a8a92db341ee519feb383a20cb4": "0df4c80430aff6e9b0cdd970bc215545",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/f3/709a83aedf1f03d6e04459831b12355a9b9ef1": "538d2edfa707ca92ed0b867d6c3903d1",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/eb/111619ebdf868bc76f0972130a780ed0e41dbf": "797d1b7e78f4b8f53a2f3e89a94a46e5",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/e3/6fb3991ace4f1075fb599212214d0d59099c5a": "435c561a6e149c460fda811ba176d9d2",
".git/objects/ec/86c895270e0261796cd8da15d336b5fce6ac57": "363b657bc1884055553d53443b22f6aa",
".git/objects/7c/25025c84676a1a123d635ea5d1aa26a57c5fdf": "8a1373aff9ffdde0c97fb1368cbeafca",
".git/objects/1f/8f05f1753094d199e4ff67051226c4aa10c96e": "ccf6e11a9e16c9d9391b0cf74a1ca1de",
".git/objects/8a/51a9b155d31c44b148d7e287fc2872e0cafd42": "9f785032380d7569e69b3d17172f64e8",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/21/d1a7d7ff94e60438a0efe740a3d3e636f3db9a": "919d58601c9c081295bbb1bfd0696eb3",
".git/objects/75/c76cb772357c19d03fb60198e672479c57244e": "9a2ff35997d499670d34142e7156d232",
".git/objects/81/15ccc0825ec91ea7a1470806a6c0d179f4477f": "3d0d5386a96e1c4219695576bd2b83b4",
".git/objects/81/44d735a37f74a71fad7cdc96c559f4b80503c3": "82501d114c0e7af80e4e599f79d398ff",
".git/objects/86/e154c94a02d91841e368ce2e8e0abb75d615a1": "1a54f44a0fdceb0f9eeea3f33b27c0ca",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/5d/2bada7b4be2007a4fe8a336e49cb3cc2fb319f": "20bd7a1dde625a7337dd97883e25b6c2",
".git/objects/91/4a40ccb508c126fa995820d01ea15c69bb95f7": "8963a99a625c47f6cd41ba314ebd2488",
".git/objects/54/561b3d5f88ccec89e0c24186b45ad2d460ca78": "1ea4148a67f4d9114cebe61b6007cdcc",
".git/objects/06/57db0d337b919725a48929097754cae5588947": "ace08f9a5e13380e02e9f8cc005375f4",
".git/objects/6c/a9e60e416296e8d7a7e060e180aea6615503b7": "165cb1819cc95b162c72ee8c6ef97e68",
".git/objects/63/d40d2b5e2914758346e0291f53e9d86c178399": "6e2c2d7645a37914e1e6874ecf264e98",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/dc/f83695f71da8c6278eb914cdd42692c427924e": "9ca7f32e12839dea4610032ada023058",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/a8/8c9340e408fca6e68e2d6cd8363dccc2bd8642": "11e9d76ebfeb0c92c8dff256819c0796",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/ef/b875788e4094f6091d9caa43e35c77640aaf21": "27e32738aea45acd66b98d36fc9fc9e0",
".git/objects/f6/fe5bc6216db58c30d5c26381e42f24f8b06985": "32c24f152cb38d9e5306e76d56918ab8",
".git/objects/e9/746f54f376e042426731b1eb8d779c5219b827": "e23e422ba7128e05a6db1d870002a742",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/e7/0a354912664499e3cb693748c043c038d5305a": "4956ba12ac3e56d0eb118f2bdca04e01",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/4f/02e9875cb698379e68a23ba5d25625e0e2e4bc": "254bc336602c9480c293f5f1c64bb4c7",
".git/objects/40/1184f2840fcfb39ffde5f2f82fe5957c37d6fa": "1ea653b99fd29cd15fcc068857a1dbb2",
".git/objects/2b/dbd24cdf5a86619669a62e75710a5bf120dbb5": "f8ee90aaa9c7387a990d1cfe3be53176",
".git/objects/7f/05a9f7a0d9435f7c0bac1acbfc92fb369a57d8": "37672dc40025aed0980d02356bc6ae7d",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "f44c38085dc517fcd6851fadd4d9327f",
".git/logs/refs/heads/gh-pages": "f44c38085dc517fcd6851fadd4d9327f",
".git/logs/refs/remotes/origin/gh-pages": "5ae41c80dcd4b3dfee0c2a05950c11d7",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/gh-pages": "d2872f5a07d0a69d153c63c40ee60838",
".git/refs/remotes/origin/gh-pages": "d2872f5a07d0a69d153c63c40ee60838",
".git/index": "89cf6529ca6fa90bb0b26881b8ead792",
".git/COMMIT_EDITMSG": "46841865939e0d07f29829728d9f7565",
"assets/AssetManifest.json": "11d52ca24784632ff7566276e2f48677",
"assets/NOTICES": "a1763666d64031eba29438214dcfd2ed",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "d361fe4b688d36b227392eecca7f2ded",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/lib/pics/alice.jpg": "6b07f454eee840ae2ccb4dd65ccd3cc1",
"assets/lib/pics/Bob.jpg": "3c6c9daa1108680f39ed3f21680de145",
"assets/lib/pics/Grace.jpg": "d3673e00ab29501e09a9fd0ea8bf86c0",
"assets/lib/pics/Charlie.jpg": "60131d530f684a18c608836873dcf8a3",
"assets/lib/pics/Eve.jpg": "49311663bbdb6e27a303816515681e3e",
"assets/lib/pics/Ivy.jpg": "9010f672b67175cde97cbad655225712",
"assets/lib/pics/Jack.jpg": "915fb10ca6f2400ef43e8e6fb132a49f",
"assets/lib/pics/Logo.jpg": "5883feba14fca0f3dc45ddc5837d7de9",
"assets/lib/pics/Hank.jpg": "ebc43ee68c2ac80f43b41e203592fdd6",
"assets/lib/pics/bac.jpg": "03a4f6e2840ebb2a8698e43e65584abe",
"assets/lib/pics/Diana.jpg": "7eaa9611bfb253d130a358d7e1a5c962",
"assets/lib/pics/Frank.jpg": "0c41395626840824e6473d90c507c451",
"assets/AssetManifest.bin": "a0b85dfefddc108b3d2b239ef12062f8",
"assets/fonts/MaterialIcons-Regular.otf": "86a17a93176146d28cbc91e3aeadfe17",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
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
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
