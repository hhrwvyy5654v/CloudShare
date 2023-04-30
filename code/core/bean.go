package core
//bean接口意味着应用程序中的单例
type Bean interface{
	//构造时初始化bean
	Init()
	//在系统清理时清理bean
	Cleanup()
	//当所有东西(包括数据库的连接)都加载时，这个方法将被调用
	Bootstrap()
	//恐慌检查的快捷方式
	PanicErroe(err error)
}