var canvas = document.createElement("canvas");
var ctx = canvas.getContext("2d");
canvas.width = window.innerWidth;
canvas.height = window.innerHeight;
document.body.appendChild(canvas);

var bgReady = false;
var bgImage = new Image();
bgImage.onload = function () {
  bgReady = true;
};

bgImage.src = "images/rpgtile1_anim_0.gif";

var heroReady = false;
var heroImage = new Image();
heroImage.onload = function () {
  heroReady = true;
};
heroImage.src = "images/soldier_1.png";

var hero = {
  speed: 256
};

var keysDown = {};

addEventListener("keydown", function (e) {
  keysDown[e.keyCode] = true;
}, false);

addEventListener("keyup", function (e) {
  delete keysDown[e.keyCode];
}, false);

var reset = function () {
  hero.x = canvas.width / 2;
  hero.y = canvas.height / 2;
};

// Update game objects
var update = function (modifier) {
  if (38 in keysDown) { // Player holding up
    hero.y -= hero.speed * modifier;
  }
  if (40 in keysDown) { // Player holding down
    hero.y += hero.speed * modifier;
  }
  if (37 in keysDown) { // Player holding left
    hero.x -= hero.speed * modifier;
  }
  if (39 in keysDown) { // Player holding right
    hero.x += hero.speed * modifier;
  }
};

// Draw everything
var render = function () {

  // Todo:: load map from DB
  var map = [
    ['t','t','t','t','t','t','t','t','t','t','t','t','t','t','t','t','t'],
    ['t','d','d','d','d','d','d','d','d','d','d','d','d','d','d','d','t'],
    ['t','d','d','d','d','d','d','d','d','d','d','d','d','d','d','d','t'],
    ['t','d','d','d','d','d','d','d','d','d','d','d','d','d','d','d','t'],
    ['t','d','d','d','d','d','d','d','d','d','d','d','d','d','d','d','t'],
    ['t','d','d','d','d','d','d','d','d','d','d','d','d','d','d','d','t']
  ];

  var lookup = {
    't':{'x':12,'y':300},
    'd':{'x':0, 'y':324} 
  };

  if (bgReady) {
    var xloc = 10;
    var yloc = 10;
    var delta = 50;
    for ( var x = 0; x < map.length; x++ ) {
      var columns = map[x];
      for (var y = 0; y < columns.length; y++) {
        var cell = map[x][y];
        var xd = lookup[cell]['x'];
        var yd = lookup[cell]['y'];
        ctx.drawImage(bgImage,xd,yd,12,12,xloc,yloc,delta,delta);
        xloc += delta;
      }
      xloc = 10;
      yloc += delta;
    }
  }

  if (heroReady) {
    ctx.drawImage(heroImage, hero.x, hero.y);
  }

};

var loop = function () {
  var now = Date.now();
  var delta = now - then;

  update(delta / 1000);
  render();

  then = now;
};

reset();
var then = Date.now();
setInterval(loop, 1);
