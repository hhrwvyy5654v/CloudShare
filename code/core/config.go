package core

//使用GORM库的子包schema进行数据库表结构的定义和管理
import "gorm.io/gorm/schema"

const(
	//cookie的验证密钥
	COOKIE_AUTH_KEY="_ak"

	USERNAME_KEY="_username"
	PASSWORD_KEY="_password"

	DEFAULT_SERVER_PORT=8080

	//数据库表的前缀，cloudshare10_表示当前版本为cloudshare:1.0.x
	TABLE_PREFIX = "cloudshare10_"
	VERSION="1.0.0"
)

type Config interface{
	//检查软件或者服务是否已经安装在计算机上
	Installed() bool
	//
	ServerPort() int
	//获取数据库类型
	DbType() string
	//例如，cloudshare:cloudshare123@tcp(127.0.0.1:3306)/cloudshare?charset=utf8&parseTime=True&loc=Local
	MysqlUrl() string
	//获取sqlite路径
	SqliteFolder() string
	//文件存储位置
	MatterPath() string
	//表名策略
	NamingStrategy() schema.NamingStrategy
	//当被用户安装时,将配置写入cloudshare.json中
	FinishInstall(dbType string, mysqlPort int, mysqlHost string, mysqlSchema string, mysqlUsername string, mysqlPassword string, mysqlCharset string)
}