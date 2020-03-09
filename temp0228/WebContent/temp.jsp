<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
@import url(https://fonts.googleapis.com/css?family=Six+Caps);
html * {
  box-sizing: border-box;
}
body {
  font-size: 16px;
  padding: 10px;
  background: #333333;
  color: #ffffff;
  text-align: center;
  height: 100vh;
  margin: 0;
  display: flex;
  align-items: center;
  height: 100vh;
}

.border-animation {
  --border-width: 0.1em;
  --animation-speed: 0.5s;
  --color: #ffffff;
  color: var(--color);
  position: relative;
  display: inline-block;
  font-size: 4em;
  line-height: 1em;
  transform: scale(1, 0.8);
  border: var(--border-width) solid transparent;
}
.border-animation .border-animation__inner {
  position: relative;
  display: inline-block;
  width: 100%;
  font-family: 'Six Caps', sans-serif;
  font-weight: 300;
  text-transform: uppercase;
  letter-spacing: 0.05em;
  cursor: pointer;
  padding: 0.2em;
  background: #333;
  z-index: 1;
  border: solid var(--border-width) transparent;
}
.border-animation:before, .border-animation:after {
  content: '';
  position: absolute;
  background: var(--color);
}
.border-animation:focus:before, .border-animation:hover:before {
  animation: beforeBorders var(--animation-speed) forwards ease-in-out;
}
.border-animation:focus:after, .border-animation:hover:after {
  animation: afterBorders var(--animation-speed) forwards ease-in-out;
}
.border-animation:focus, .border-animation:hover {
  animation: borderColors var(--animation-speed) steps(1) forwards;
  outline: none;
}
.border-animation:focus .border-animation__inner, .border-animation:hover .border-animation__inner {
  animation: background calc(var(--animation-speed) / 5 * 3) forwards ease-in-out;
  animation-delay: calc(var(--animation-speed) / 5 * 2);
}
@keyframes beforeBorders {
  0% {
    top: calc(var(--border-width) * -1);
    left: 50%;
    bottom: auto;
    right: auto;
    width: 0;
    height: var(--border-width);
  }
  33% {
    top: calc(var(--border-width) * -1);
    left: calc(var(--border-width) * -1);
    bottom: auto;
    right: auto;
    width: calc(var(--border-width) + 50%);
    height: var(--border-width);
  }
  66% {
    top: calc(var(--border-width) * -1);
    left: calc(var(--border-width) * -1);
    bottom: auto;
    right: auto;
    width: var(--border-width);
    height: calc((var(--border-width) * 2) + 100%);
  }
  100% {
    top: auto;
    left: calc(var(--border-width) * -1);
    bottom: calc(var(--border-width) * -1);
    right: auto;
    width: calc(var(--border-width) + 50%);
    height: calc((var(--border-width) * 2) + 100%);
  }
}
@keyframes afterBorders {
  0% {
    top: calc(var(--border-width) * -1);
    left: auto;
    bottom: auto;
    right: 50%;
    width: 0;
    height: var(--border-width);
  }
  33% {
    top: calc(var(--border-width) * -1);
    left: auto;
    bottom: auto;
    right: calc(var(--border-width) * -1);
    width: calc(var(--border-width) + 50%);
    height: var(--border-width);
  }
  66% {
    top: calc(var(--border-width) * -1);
    left: auto;
    bottom: auto;
    right: calc(var(--border-width) * -1);
    width: var(--border-width);
    height: calc((var(--border-width) * 2) + 100%);
  }
  100% {
    top: auto;
    left: auto;
    bottom: calc(var(--border-width) * -1);
    right: calc(var(--border-width) * -1);
    width: calc(var(--border-width) + 50%);
    height: calc((var(--border-width) * 2) + 100%);
  }
}
@keyframes borderColors {
  0% {
    border-top-color: transparent;
    border-right-color: transparent;
    border-bottom-color: transparent;
    border-left-color: transparent;
  }
  33% {
    border-top-color: var(--color);
    border-right-color: transparent;
    border-bottom-color: transparent;
    border-left-color: transparent;
  }
  66% {
    border-top-color: var(--color);
    border-right-color: var(--color);
    border-bottom-color: transparent;
    border-left-color: var(--color);
  }
  100% {
    border-top-color: var(--color);
    border-right-color: var(--color);
    border-bottom-color: var(--color);
    border-left-color: var(--color);
  }
}
@keyframes background {
  to {
    background: #555;
    text-shadow: 0 0.1em 0.1em #111;
  }
}
@media (min-width: 850px) {
  body {
    justify-content: center;
  }
}
@media (min-width: 1200px) {
  .border-animation {
    font-size: 6em;
    line-height: 1em;
  }
}




</style>
</head>
<body>
  
  	<a class="border-animation" href="#">
    	<div class="border-animation__inner">GREEN FUTSALs PARK</div>
    </a>
  
</body>
</html>