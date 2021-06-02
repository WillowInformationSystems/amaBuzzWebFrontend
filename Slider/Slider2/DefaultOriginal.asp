

<!DOCTYPE html>
<html lang="en" >

<head>

  <meta charset="UTF-8">
  
<link rel="apple-touch-icon" type="image/png" href="https://static.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen">

<link rel="shortcut icon" type="image/x-icon" href="https://static.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />

<link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />


  <title>CodePen - Rolling Range Slider</title>
  
  
  
  
<style>
html,
body {
  margin: 0;
  height: 100%;
}
body {
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #a9cbee;
}
input[type="range"] {
  -webkit-appearance: none;
  background: transparent;
  width: 90%;
  max-width: 500px;
  outline: none;
}
input[type="range"]:focus,
input[type="range"]:active,
input[type="range"]::-moz-focus-inner,
input[type="range"]::-moz-focus-outer {
  border: 0;
  outline: none;
}
input[type="range"]::-moz-range-thumb {
  border: none;
  height: 50px;
  width: 50px;
  background-color: transparent;
  background-image: url("https://storage.googleapis.com/pw-stuff/thumbs-sprite.png");
  background-position: 0 0;
  background-size: cover;
  transform: scale(1.9) rotateZ(var(--thumb-rotate, 10deg));
  cursor: pointer;
}
input[type="range"]::-moz-range-thumb:active {
  background-position: 100% 0px;
  transform: scale(2) rotateZ(var(--thumb-rotate, 10deg));
}
input[type="range"]::-moz-range-track {
  width: 100%;
  height: 20px;
  background: #eee;
  border-radius: 10px;
  box-shadow: 2px 2px 4px rgba(0,0,0,0.4);
  cursor: pointer;
}
input[type="range"]::-moz-range-progress {
  height: 20px;
  background: #4685d7;
  border-radius: 10px;
  cursor: pointer;
}
input[type="range"]::-webkit-slider-thumb {
  border: none;
  height: 50px;
  width: 50px;
  background-color: transparent;
  background-image: url("https://storage.googleapis.com/pw-stuff/thumbs-sprite.png");
  background-position: 0 0;
  background-size: cover;
  transform: scale(1.9) rotateZ(var(--thumb-rotate, 10deg));
  cursor: pointer;
  margin-top: -15px;
  -webkit-appearance: none;
}
input[type="range"]::-webkit-slider-thumb:active {
  background-position: 100% 0px;
  transform: scale(2) rotateZ(var(--thumb-rotate, 10deg));
}
input[type="range"]::-webkit-slider-runnable-track {
  width: 100%;
  height: 20px;
  background: #eee;
  border-radius: 10px;
  box-shadow: 2px 2px 4px rgba(0,0,0,0.4);
  cursor: pointer;
  -webkit-appearance: none;
}
label {
  background: #eee;
  border-radius: 50%;
  box-shadow: 2px 2px 4px rgba(0,0,0,0.4);
  padding: 14px;
  margin-left: 10px;
  font-family: Roboto, 'Helvetica Neue', Arial;
  font-size: 20px;
  width: 25px;
  text-align: center;
  color: #2968bb;
  font-weight: bold;
  content: '';
}
.twitter-link {
  position: absolute;
  bottom: 4px;
  margin: auto;
  font-family: sans-serif;
  font-size: 12px;
  color: rgba(0,0,0,0.6);
}
</style>

  <script>
  window.console = window.console || function(t) {};
</script>

  
  
  <script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>


</head>

<body translate="no" >
  <input id="slider" name="slider" type="range" value=0>
<label for="slider">0</label>




<a class="twitter-link" href="https://twitter.com/phil_osophie" target="_blank" >by @phil_osophie</a>
    <script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>

  
  
      <script id="rendered-js" >
const input = document.querySelector("input");
const label = document.querySelector("label");

input.addEventListener("input", event => {
  const value = Number(input.value) / 100;
  input.style.setProperty("--thumb-rotate", `${value * 720}deg`);
  label.innerHTML = Math.round(value * 50);
});
//# sourceURL=pen.js
    </script>

  

</body>

</html>
 
