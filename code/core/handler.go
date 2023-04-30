package core

//运行一个有惊无险的方法 recovery
func RunWithRecovery(f func()){
	defer func(){
		if err:=recover();err!=nil{
			LOGGER.Error("error in async method: %v", err)
		}
	}()

	//执行该方法
	f()
}

//惊恐检查的快捷方式
func PanicError(err error) {
	if err != nil {
		panic(err)
	}
}
