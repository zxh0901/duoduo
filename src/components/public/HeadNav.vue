<template>
  <div class="main">
    <div class="container">
      <ul id="u1" class="nav">
        <li v-for="item of list" :key="item.id" class="nav-item">
          <router-link :to="item.path" class="nav-link">{{item.name}}</router-link>
        </li>
      </ul>
      <span id="s1" class="show" @click="mode1">&or;</span>
    </div>
  </div>
</template>

<script>
export default {
  name: "Header",
  data() {
    return {
      list: [
        {
          path: "/index/all",
          name: "全部"
        },
        {
          path: "/index/phone",
          name: "手机"
        },
        {
          path: "/index/sm",
          name: "数码"
        },
        {
          path: "/index/fs",
          name: "服饰"
        },
        {
          path: "/index/jj",
          name: "家具"
        },
        {
          path: "/index/mz",
          name: "美妆"
        },
        {
          path: "/index/yd",
          name: "运动"
        },
        {
          path: "/index/jd",
          name: "家电"
        },
        {
          path: "/index/other",
          name: "其他"
        }
      ]
    };
  },
  mounted() {
    this.li();
  },
  methods: {
    mode1() {
      var show = document.getElementById("s1");
      show.className = show.className == "show" ? "show2" : "show";
      var nav = document.getElementById("u1");
      nav.style.height = nav.style.height == "120px" ? "60px" : "120px";
    },
    li() {
      var li = document.getElementsByTagName("li");
      var str = this.$route.path;
      var arr = str.split("/");
      var x = "";
      for (var i = 0; i < li.length; i++) {
        li[i].index = i;
        li[i].onclick = function() {
          for (var j = 0; j < li.length; j++) {
            li[j].className = "";
          }
          this.className = "on";
        };
      }
      if (arr[arr.length - 1] == "all" || arr[arr.length - 1] == "") {
        x = 0;
      } else if (arr[arr.length - 1] == "phone") {
        x = 1;
      } else if (arr[arr.length - 1] == "sm") {
        x = 2;
      } else if (arr[arr.length - 1] == "fs") {
        x = 3;
      } else if (arr[arr.length - 1] == "jj") {
        x = 4;
      } else if (arr[arr.length - 1] == "mz") {
        x = 5;
      } else if (arr[arr.length - 1] == "yd") {
        x = 6;
      } else if (arr[arr.length - 1] == "jd") {
        x = 7;
      } else if (arr[arr.length - 1] == "other") {
        x = 8;
      }
      li[x].className = "on";
    }
  }
};
</script>

<style scoped>
.main {
  margin-top: 20px;
  margin-bottom: 10px;
  margin-left: auto;
  margin-right: auto;
}
.container {
  border-radius: 4px;
  background-color: #ffd84d;
}
.nav {
  overflow: hidden;
  transition: all 0.5s;
  line-height: 43px;
  height: 60px;
}
.nav a {
  color: black;
  font-family: "宋体";
}
/* .nav a:hover {
  color: white;
} */
.nav li {
  margin-left: 4.5%;
}
.on {
  font-weight: 800;
  font-size: 24px;
  font-family: "微软雅黑";
  color: #ffffff;
}
.on::after {
  content: "";
  display: block;
  border-bottom: 2px solid black;
  margin-top: -10px;
  width: 55%;
  margin-left: auto;
  margin-right: auto;
}
.show {
  float: right;
  margin-top: -6%;
  display: none;
  cursor: pointer;
  transform: rotate(0deg);
}
.show2 {
  float: right;
  margin-top: -6%;
  display: none;
  cursor: pointer;
  transform: rotate(180deg);
}
@media screen and (min-width: 991px) and (max-width: 1199px) {
  .show {
    display: block;
    margin-top: -4.6%;
  }
  .show2 {
    display: block;
    margin-top: -4.6%;
  }
}
@media screen and (min-width: 770px) and (max-width: 990px) {
  .show {
    display: block;
  }
  .show2 {
    display: block;
  }
  .nav li {
    margin-left: 4%;
  }
}
@media screen and (max-width: 769px) {
  .nav {
    overflow: inherit;
    height: 120px;
  }
}
@media screen and (max-width: 570px) {
  .nav {
    overflow: inherit;
    height: 180px;
  }
}
</style>