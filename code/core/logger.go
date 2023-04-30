package core

type Logger interface{
	//基本的日志方法
	Log(prefix string, format string, v ...interface{})

	//有不同级别的日志
	Debug(format string,v ...interface{})	//调试信息
	Info(format string,v ...interface{})	//普通信息
	Warn(format string,v ...interface{})	//警告信息
	Error(format string,v ...interface{})	//错误信息
	Panic(format string,v ...interface{})	//严重错误信息
}