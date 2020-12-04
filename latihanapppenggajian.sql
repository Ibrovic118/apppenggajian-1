# Host: localhost  (Version 5.5.5-10.4.14-MariaDB)
# Date: 2020-11-21 21:08:26
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "admin"
#

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `idadmin` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `namalengkap` varchar(40) NOT NULL,
  PRIMARY KEY (`idadmin`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

#
# Data for table "admin"
#

INSERT INTO `admin` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','febrian saputra'),(6,'Rendy','88ad32a14f7f7964d03dad411ffcc59b','Rendy Febriansyah');

#
# Structure for table "golongan"
#

DROP TABLE IF EXISTS `golongan`;
CREATE TABLE `golongan` (
  `kode_golongan` varchar(3) NOT NULL,
  `nama_golongan` varchar(10) NOT NULL,
  `tunjangan_suami_istri` int(10) NOT NULL,
  `tunjangan_anak` int(10) NOT NULL,
  `uang_makan` int(10) NOT NULL,
  `uang_lembur` int(10) NOT NULL,
  `askes` int(10) NOT NULL,
  PRIMARY KEY (`kode_golongan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "golongan"
#

INSERT INTO `golongan` VALUES ('G01','3A',750000,500000,15000,7000,150000),('G02','3B',650000,450000,15000,7000,150000);

#
# Structure for table "jabatan"
#

DROP TABLE IF EXISTS `jabatan`;
CREATE TABLE `jabatan` (
  `kode_jabatan` varchar(3) NOT NULL,
  `nama_jabatan` varchar(40) NOT NULL,
  `gapok` int(10) NOT NULL,
  `tunjangan_jabatan` int(10) NOT NULL,
  PRIMARY KEY (`kode_jabatan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "jabatan"
#

INSERT INTO `jabatan` VALUES ('J01','Manager',7500000,1500000),('J02','Manager Operasional',10000000,1750000);

#
# Structure for table "pegawai"
#

DROP TABLE IF EXISTS `pegawai`;
CREATE TABLE `pegawai` (
  `nip` varchar(20) NOT NULL,
  `nama_pegawai` varchar(40) NOT NULL,
  `kode_jabatan` varchar(3) NOT NULL,
  `kode_golongan` varchar(3) NOT NULL,
  `status` varchar(15) NOT NULL,
  `jumlah_anak` int(2) NOT NULL,
  PRIMARY KEY (`nip`),
  KEY `kode_jabatan` (`kode_jabatan`),
  KEY `kode_golongan` (`kode_golongan`),
  CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`kode_jabatan`) REFERENCES `jabatan` (`kode_jabatan`) ON UPDATE CASCADE,
  CONSTRAINT `pegawai_ibfk_2` FOREIGN KEY (`kode_golongan`) REFERENCES `golongan` (`kode_golongan`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "pegawai"
#

INSERT INTO `pegawai` VALUES ('1712510310','Rendy Febriansyah','J02','G01','Belum Menikah',0),('1712510311','Ibrovic','J01','G01','Menikah',7);

#
# Structure for table "master_gaji"
#

DROP TABLE IF EXISTS `master_gaji`;
CREATE TABLE `master_gaji` (
  `bulan` varchar(20) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `masuk` int(5) NOT NULL,
  `sakit` int(5) NOT NULL,
  `izin` int(5) NOT NULL,
  `alpha` int(5) NOT NULL,
  `lembur` int(5) NOT NULL,
  `potongan` int(10) NOT NULL,
  KEY `nip` (`nip`),
  CONSTRAINT `master_gaji_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "master_gaji"
#

INSERT INTO `master_gaji` VALUES ('102020','1712510310',25,1,0,0,10,0);
