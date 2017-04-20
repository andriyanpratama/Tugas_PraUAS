-- phpMyAdmin SQL Dump
-- version 2.11.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 12, 2015 at 02:00 PM
-- Server version: 5.0.45
-- PHP Version: 5.2.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `perpustakaandb`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id` int(4) NOT NULL auto_increment,
  `no_anggota` varchar(10) collate latin1_general_ci NOT NULL,
  `nama` varchar(50) collate latin1_general_ci NOT NULL,
  `jk` varchar(15) collate latin1_general_ci NOT NULL,
  `telp` varchar(15) collate latin1_general_ci NOT NULL,
  `alamat` varchar(100) collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id`, `no_anggota`, `nama`, `jk`, `telp`, `alamat`) VALUES
(1, 'A-1', 'Mahmud', 'Laki-laki', '0879837373', 'Rancabolang'),
(2, 'A-2', 'Azizul', 'Laki-laki', '098984747', 'Andir'),
(3, 'A-3', 'Alvian', 'Perempuan', '0898333988', 'Rancamanyar');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int(4) NOT NULL auto_increment,
  `kode` varchar(15) collate latin1_general_ci NOT NULL,
  `judul` varchar(50) collate latin1_general_ci NOT NULL,
  `pengarang` varchar(35) collate latin1_general_ci NOT NULL,
  `penerbit` varchar(35) collate latin1_general_ci NOT NULL,
  `isbn` varchar(30) collate latin1_general_ci NOT NULL,
  `stok` int(4) NOT NULL,
  `kategori_id` int(4) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `kode`, `judul`, `pengarang`, `penerbit`, `isbn`, `stok`, `kategori_id`) VALUES
(1, 'BK-2016-001', 'Belajar Java Netbeans', 'Elexmedia', 'Mahfudz Ilhamnudin', '9848484', 3, 2),
(2, 'BK-2016-002', 'Belajar Java Dasar', 'Jamiat Abdillah', 'Gramedia', '09848484', 79, 1),
(4, 'BK-2016-003', 'Jaringan Komputer', 'Marmud', 'Gramedia', '90983738', 86, 1),
(5, 'BK-2016-004', 'Trick Windows Server 2008', 'Suef', 'Erlangga', '93838383', 78, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(4) NOT NULL auto_increment,
  `nama` varchar(50) collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama`) VALUES
(1, 'Pelajaran'),
(2, 'Novel'),
(3, 'Majalah'),
(4, 'Komik');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id` int(4) NOT NULL auto_increment,
  `no_pinjam` varchar(15) collate latin1_general_ci NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `anggota_id` int(4) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id`, `no_pinjam`, `tgl_pinjam`, `tgl_kembali`, `anggota_id`) VALUES
(1, 'P1702-1', '2017-02-09', '2017-02-19', 1),
(2, 'P1702-2', '2017-02-08', '2017-02-09', 2),
(3, 'P1702-3', '2017-02-30', '2017-02-31', 3),
(4, 'P1702-4', '2017-02-30', '2017-02-31', 2),
(5, 'P1702-5', '2017-02-30', '2017-02-31', 1),
(6, 'P1703-6', '2017-03-06', '2017-03-07', 3),
(7, 'P1703-7', '2017-03-06', '2017-03-07', 2);

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman_detail`
--

CREATE TABLE `peminjaman_detail` (
  `id_pinjam` int(4) NOT NULL,
  `id_buku` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `peminjaman_detail`
--

INSERT INTO `peminjaman_detail` (`id_pinjam`, `id_buku`) VALUES
(6, 4),
(6, 2),
(7, 5),
(7, 4);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int(4) NOT NULL auto_increment,
  `nama` varchar(50) collate latin1_general_ci NOT NULL,
  `telp` varchar(15) collate latin1_general_ci NOT NULL,
  `alamat` varchar(50) collate latin1_general_ci NOT NULL,
  `username` varchar(35) collate latin1_general_ci NOT NULL,
  `password` varchar(35) collate latin1_general_ci NOT NULL,
  `hak_akses` varchar(30) collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `nama`, `telp`, `alamat`, `username`, `password`, `hak_akses`) VALUES
(3, 'Andriyanto', '0', 'Rancamanyar', 'admin', 'admin', 'Admin'),
(4, 'Alvian', '0', 'Arcamanik', 'operator1', 'operator1', 'Operator');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `max_buku` int(2) NOT NULL,
  `batas_pinjam` int(2) NOT NULL,
  `denda` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`max_buku`, `batas_pinjam`, `denda`) VALUES
(3, 1, 3000);
