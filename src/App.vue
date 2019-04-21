<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
export default {
  name: "App"
};
</script>

<style>
* {
  margin: 0;
  padding: 0;
}
body,
html {
  background: #f0f0f0;
}
.container-fluid {
  min-width: 1030px;
}
.container {
  min-width: 820px;
}
.hig {
  min-height: 600px;
}
.hig .card-img-top {
  height: 260px;
}
.black {
  background: #ffd84d;
}
.card {
  border: none;
  background: none;
}
.card-title {
  height: 40px;
  font-size: 16px;
  overflow: hidden;
}
a {
  transition: all 0.5s;
  color: black;
}
.hig a {
  opacity: 1;
  border: 1px solid #c0c0c0;
  margin-bottom: 20px;
  display: block;
  border-radius: 4px;
  height: 100%;
}
.hig a:hover {
  color: black;
  text-decoration: none;
  box-shadow: 10px 10px 5px #e6c5c5;
}
.card-body {
  background: #ffd84d;
  height: 31%;
}
</style>
