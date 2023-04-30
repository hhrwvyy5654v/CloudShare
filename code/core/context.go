package core

import (
	"code/tool/cache"
	"gorm.io/gorm"
	"net/http"
)

type Context interface {
	http.Handler

	//所有的数据库连接都将使用这个
	GetDB() *gorm.DB

	GetBean(bean Bean) Bean

	//获取全局会话缓存
	GetSessionCache() *cache.Table

	GetControllerMap() map[string]Controller

	//该方法将调用每个bean的Bootstrap方法
	InstallOK()

	//该方法将调用每个Bean的Cleanup方法
	Cleanup()
}
