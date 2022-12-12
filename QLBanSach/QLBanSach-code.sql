CREATE DATABASE QLBanSach;
USE QLBanSach;
CREATE TABLE KhachHang (
    MaKH INT PRIMARY KEY AUTO_INCREMENT,
    TaiKhoan VARCHAR(50),
    MatKhau VARCHAR(255),
    Email VARCHAR(100),
    DiaChi VARCHAR(255),
    HoTen VARCHAR(100),
    NgaySinh DATE,
    GioiTinh BOOLEAN,
    DienThoai VARCHAR(20)
);
CREATE TABLE DonHang (
    MaDonHang INT PRIMARY KEY AUTO_INCREMENT,
    DaThanhToan BOOLEAN,
    TinhTrangGH VARCHAR(100),
    NgayDat DATE,
    NgayGiao DATE,
    MaKH INT,
    FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
);
CREATE TABLE ChuDe (
    MaChuDe INT PRIMARY KEY AUTO_INCREMENT,
    TenChuDe VARCHAR(255)
);
CREATE TABLE NhaXuatBan(
    MaNSX INT PRIMARY KEY AUTO_INCREMENT,
    TenNSB VARCHAR(100),
    DienThoai VARCHAR(20),
    DiaChi VARCHAR(255)
);
CREATE TABLE TacGia (
    MaTacGia INT PRIMARY KEY AUTO_INCREMENT,
    TenTacGia VARCHAR(100),
    DiaChi VARCHAR(255),
    TieuSu VARCHAR(255),
    DienThoai VARCHAR(20)
);
CREATE TABLE Sach (
    MaSach INT PRIMARY KEY AUTO_INCREMENT,
    TenSach VARCHAR(100),
    GiaBan INT,
    MoTa VARCHAR(100),
    AnhBia TEXT,
    NgayCapNhat DATE,
    SoLuongTon INT,
    MaChuDe INT,
    MaNSX INT,
    FOREIGN KEY (MaChuDe) REFERENCES ChuDe(MaChuDe),
    FOREIGN KEY (MaNSX) REFERENCES NhaXuatBan(MaNSX)
);
CREATE TABLE ChiTietDonHang (
    MaDonHang INT,
    MaSach INT,
    SoLuong INT,
    DonGia INT,
    PRIMARY KEY (MaSach, MaDonHang),
    FOREIGN KEY (MaSach) REFERENCES Sach(MaSach),
	FOREIGN KEY (MaDonHang) REFERENCES DonHang(MaDonHang)
);
CREATE TABLE ChiTietTacGia (
    MaSach INT,
    MaTacGia INT,
    VaiTro VARCHAR(100),
    ViTri VARCHAR(100),
    PRIMARY KEY (MaSach, MaTacGia),
    FOREIGN KEY (MaSach) REFERENCES Sach(MaSach),
    FOREIGN KEY (MaTacGia) REFERENCES TacGia(MaTacGia)
);
