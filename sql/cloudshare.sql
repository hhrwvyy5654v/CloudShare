DROP DATABASE IF EXISTS CloudShare;
CREATE DATABASE CloudShare;
USE CloudShare;


CREATE TABLE `cloudshare10_Bridge`(
    `UUID` char(36) NOT NULL DEFAULT '',
    `Sort` bigint(20) NOT NULL,
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `CreateTime` timestamp NOT NULL DEFAULT '2023-04-30 00:00:00',
    `ShareUUID` char(36) DEFAULT NULL, 
    `MatterUUID` char(36) DEFAULT NULL,
    PRIMARY KEY (`UUID`),   
    UNIQUE KEY `UUID` (`UUID`)  
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `cloudshare10_Dashboard`(
    `UUID` char(36) NOT NULL DEFAULT '',
    `Sort` bigint(20) NOT NULL,
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `CreateTime` timestamp NOT NULL DEFAULT '2023-04-30 00:00:00', 
    `InvokeNum` bigint(20) NOT NULL,
    `TotalInvokeNum` bigint(20) NOT NULL DEFAULT '0',
    `UV` bigint(20) NOT NULL DEFAULT '0',
    `TotalUV` bigint(20) NOT NULL DEFAULT '0',
    `MatterNum` bigint(20) NOT NULL DEFAULT '0',
    `TotalMatterNum` bigint(20) NOT NULL DEFAULT '0',
    `FileSize` bigint(20) NOT NULL DEFAULT '0',
    `TotalFileSize` bigint(20) NOT NULL DEFAULT '0',
    `AverageCost` bigint(20) NOT NULL DEFAULT '0',
    `DataTime` varchar(45) NOT NULL,
    PRIMARY KEY (`UUID`),   
    UNIQUE KEY `UUID` (`UUID`),  
    KEY `Index_DataTime` (`DataTime`) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `cloudshare10_DownloadToken`(
    `UUID` char(36) NOT NULL DEFAULT '',
    `Sort` bigint(20) NOT NULL,
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `CreateTime` timestamp NOT NULL DEFAULT '2023-04-30 00:00:00', 
    `UserUUID` char(36) NOT NULL,
    `MatterUUID` char(36) NOT NULL,
    `ExpireTime` timestamp NOT NULL DEFAULT '2023-04-30 00:00:00', 
    `IP` varchar(128) NOT NULL,
    PRIMARY KEY (`UUID`),   
    UNIQUE KEY `UUID` (`UUID`),  
    KEY `Index_MatterUUID` (`MatterUUID`) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `cloudshare10_FootPrint`(
    `UUID` char(36) NOT NULL DEFAULT '',
    `Sort` bigint(20) NOT NULL,
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `CreateTime` timestamp NOT NULL DEFAULT '2023-04-30 00:00:00', 
    `UserUUID` char(36) DEFAULT NULL,
    `IP` varchar(128) NOT NULL,
    `Host` varchar(45) NOT NULL,
    `URL` varchar(255) NOT NULL,
    `Params` text,
    `Cost` bigint(20) NOT NULL DEFAULT '0',
    `Success` tinyint(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (`UUID`), 
    UNIQUE KEY `UUID` (`UUID`) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `cloudshare10_ImageCache`(
    `UUID` char(36) NOT NULL DEFAULT '',
    `Sort` bigint(20) NOT NULL,
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `CreateTime` timestamp NOT NULL DEFAULT '2023-04-30 00:00:00', 
    `Name` varchar(255) NOT NULL,
    `UserUUID` char(36) DEFAULT NULL,
    `UserName` varchar(45) NOT NULL,
    `MatterUUID` char(36) DEFAULT NULL,
    `MatterName` varchar(255) NOT NULL,
    `Mode` varchar(512) DEFAULT NULL,
    `MD5` varchar(45) DEFAULT NULL,
    `Size` bigint(20) NOT NULL DEFAULT '0',
    `Path` varchar(512) DEFAULT NULL,
    PRIMARY KEY (`UUID`), 
    UNIQUE KEY `UUID` (`UUID`), 
    KEY `Index_MatterUUID` (`MatterUUID`) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `cloudshare10_Matter`(
    `UUID` char(36) NOT NULL DEFAULT '',
    `Sort` bigint(20) NOT NULL,
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `CreateTime` timestamp NOT NULL DEFAULT '2023-04-30 00:00:00',
    `PUUID` char(36) DEFAULT NULL,
    `UserUUID` char(36) DEFAULT NULL,
    `UserName` varchar(45) NOT NULL,
    `Dir` tinyint(1) NOT NULL DEFAULT '0',
    `Name` varchar(255) NOT NULL,
    `MD5` varchar(45) DEFAULT NULL,
    `Size` bigint(20) NOT NULL DEFAULT '0',
    `Privacy` tinyint(1) NOT NULL DEFAULT '0',
    `Path` varchar(1024) DEFAULT NULL,
    `Times` bigint(20) NOT NULL DEFAULT '0',
    `Prop` varchar(1024) NOT NULL DEFAULT '{}',
    `VisitTime` timestamp NOT NULL DEFAULT '2023-04-30 00:00:00',
    `Deleted` tinyint(1) NOT NULL DEFAULT '0',
    `DeleteTime` timestamp NOT NULL DEFAULT '2023-04-30 00:00:00', 
    PRIMARY KEY (`UUID`), 
    UNIQUE KEY `UUID` (`UUID`), 
    KEY `Index_PUUID` (`PUUID`), 
    KEY `Index_UserUUID` (`UserUUID`), 
    KEY `Index_Deleted` (`Deleted`), 
    KEY `Index_DeleteTime` (`DeleteTime`) 
    )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `cloudshare10_Preference`(
    `UUID` char(36) NOT NULL DEFAULT '',
    `Sort` bigint(20) NOT NULL,
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `CreateTime` timestamp NOT NULL DEFAULT '2023-04-30 00:00:00',
    `Name` varchar(45) DEFAULT NULL,
    `LogoUrl` varchar(255) DEFAULT NULL,
    `FaviconUrl` varchar(255) DEFAULT NULL,
    `Copyright` varchar(1024) DEFAULT NULL,
    `Record` varchar(1024) DEFAULT NULL,
    `DownloadDirMaxSize` bigint(20) NOT NULL DEFAULT '-1',
    `DownloadDirMaxNum` bigint(20) NOT NULL DEFAULT '-1',
    `DefaultTotalSizeLimit` bigint(20) NOT NULL DEFAULT '-1',
    `AllowRegister` tinyint(1) NOT NULL DEFAULT '0',
    `PreviewConfig` text,
    `ScanConfig` text,
    `DeletedKeepDays` bigint(20) NOT NULL DEFAULT '7',
    PRIMARY KEY (`UUID`), 
    UNIQUE KEY `UUID` (`UUID`) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `cloudshare10_Session`(
    `UUID` char(36) NOT NULL DEFAULT '',
    `sort` bigint(20) NOT NULL,
    `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `create_time` timestamp NOT NULL DEFAULT '2023-04-30 00:00:00',
    `user_uuid` char(36) DEFAULT NULL,
    `ip` varchar(128) NOT NULL,
    `expire_time` timestamp NOT NULL DEFAULT '2023-04-30 00:00:00',
    PRIMARY KEY (`UUID`), 
    UNIQUE KEY `UUID` (`UUID`) 
)

CREATE TABLE `cloudshare10_Share`(
    `UUID` char(36) NOT NULL DEFAULT '',
    `Sort` bigint(20) NOT NULL,
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `CreateTime` timestamp NOT NULL DEFAULT '2023-04-30 00:00:00',
    `Name` varchar(255) DEFAULT NULL,
    `ShareType` varchar(45) DEFAULT NULL,
    `UserName` varchar(45) DEFAULT NULL,
    `UserUUID` char(36) DEFAULT NULL,
    `DownloadTimes` bigint(20) NOT NULL DEFAULT '0',
    `Code` varchar(45) NOT NULL,
    `ExpireInfinity` tinyint(1) NOT NULL DEFAULT '0',
    `ExpireTime` timestamp NOT NULL DEFAULT '2023-04-30 00:00:00',
    PRIMARY KEY (`UUID`), 
    UNIQUE KEY `UUID` (`UUID`) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `cloudshare10_UploadToken` (
    `UUID` char(36) NOT NULL DEFAULT '',
    `Sort` bigint(20) NOT NULL,
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `CreateTime` timestamp NOT NULL DEFAULT '2023-04-30 00:00:00',
    `UserUUID` char(36) NOT NULL,
    `FolderUUID` char(36) NOT NULL,
    `MatterUUID` char(36) NOT NULL,
    `ExpireTime` timestamp NOT NULL DEFAULT '2023-04-30 00:00:00',
    `FileName` varchar(255) NOT NULL,
    `Privacy` tinyint(1) NOT NULL DEFAULT '0',
    `Size` bigint(20) NOT NULL DEFAULT '0',
    `IP` varchar(128) NOT NULL,
    PRIMARY KEY (`UUID`), 
    UNIQUE KEY `UUID` (`UUID`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `cloudshare10_User` (
    `UUID` char(36) NOT NULL DEFAULT '',
    `Sort` bigint(20) NOT NULL,
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `CreateTime` timestamp NOT NULL DEFAULT '2023-04-30 00:00:00',
    `Role` varchar(45) DEFAULT NULL,
    `UserName` varchar(45) NOT NULL,
    `Password` varchar(255) DEFAULT NULL,
    `AvatarUrl` varchar(255) DEFAULT NULL,
    `LastIP` varchar(128) DEFAULT NULL,
    `LastTime` timestamp NOT NULL DEFAULT '2023-04-30 00:00:00',
    `SizeLimit` bigint(20) NOT NULL DEFAULT '-1',
    `TotalSizeLimit` bigint(20) NOT NULL DEFAULT '-1',
    `TotalSize` bigint(20) NOT NULL DEFAULT '0',
    `Status` varchar(45) DEFAULT NULL,
    PRIMARY KEY (`UUID`),   
    UNIQUE KEY `UserName` (`UserName`),
    UNIQUE KEY `UUID` (`UUID`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;