import Vue from 'vue'
import Router from 'vue-router'
import Index from '@/components/Index'
import All from '@/components/navClass/All'
import Fs from '@/components/navClass/Fs'
import Phone from '@/components/navClass/Phone'
import Jd from '@/components/navClass/Jd'
import Mz from '@/components/navClass/Mz'
import Other from '@/components/navClass/Other'
import Sm from '@/components/navClass/Sm'
import Yd from '@/components/navClass/Yd'
import Jj from '@/components/navClass/Jj'
import GoodsList from '@/components/goodsList/GoodsList'
import SeaRch from '@/components/SeaRch'
import RegisTer from '@/components/user/RegisTer'
import UserCenter from '@/components/user/UserCenter'
import UserBase from '@/components/user/UserBase'
import ReleAse from '@/components/user/ReleAse'
import GoodsSx from '@/components/user/goods/GoodsSx'
import GoodsCs from '@/components/user/goods/GoodsCs'
import GoodsMc from '@/components/user/goods/GoodsMc'
import MyMessage from '@/components/user/message/MyMessage'
import MessageReply from '@/components/user/message/MessageReply'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [{
      path: '/',
      name: '',
      component: Index,
      children: [{
        path: '',
        component: All
      }]
    },
    {
      path: '/index',
      name: 'Index',
      component: Index,
      children: [{
          path: 'all',
          component: All
        }, {
          path: 'phone',
          component: Phone
        },
        {
          path: 'fs',
          component: Fs
        }, {
          path: 'jd',
          component: Jd
        },
        {
          path: 'mz',
          component: Mz
        }, {
          path: 'other',
          component: Other
        }, {
          path: 'sm',
          component: Sm
        },
        {
          path: 'yd',
          component: Yd
        }, {
          path: 'jj',
          component: Jj
        }
      ]
    },
    {
      path: '/glist',
      name: 'GoodsList',
      component: GoodsList
    },
    {
      path: '/sname',
      name: 'SeaRch',
      component: SeaRch
    },
    {
      path: '/regpage',
      name: 'RegisTer',
      component: RegisTer
    },
    {
      path: '/usercenter',
      name: 'UserCenter',
      component: UserCenter,
      children: [{
          path: 'userbase',
          component: UserBase
        },
        {
          path: 'release',
          component: ReleAse
        },
        {
          path: 'goods_sx',
          component: GoodsSx
        },
        {
          path: 'goods_cs',
          component: GoodsCs
        },
        {
          path: 'goods_mc',
          component: GoodsMc
        },
        {
          path: 'my_message',
          component: MyMessage
        },
        {
          path: 'message_reply',
          component: MessageReply
        }
      ]
    }
  ],
  scrollBehavior(to, from, savedPosition) {
    if (savedPosition) {
      return savedPosition
    }
    return {
      x: 0,
      y: 0
    }
  }
})
