package core

import "net/http"

type Controller interface{
	Bean
	//注册固定路线
	RegisterRoutes() map[string]func(writer http.ResponseWriter, request *http.Request)
	//处理一些特殊的路线，例如：URL中的参数
	HandleRoutes(writer http.ResponseWriter, request *http.Request) (func(writer http.ResponseWriter, request *http.Request), bool)
}