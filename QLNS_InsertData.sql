--- INSERT DATA ---
GO
USE QLNS

---CHUCNANG---
insert into CHUCNANG(TenCN, MoTa) values (N'Quản lý nhân viên', N'')
insert into CHUCNANG(TenCN, MoTa) values (N'Phân quyền', N'')
insert into CHUCNANG(TenCN, MoTa) values (N'Quản lý loại khách hàng', N'')
insert into CHUCNANG(TenCN, MoTa) values (N'Quản lý khách hàng', N'')
insert into CHUCNANG(TenCN, MoTa) values (N'Quản lý danh mục sản phẩm', N'')
insert into CHUCNANG(TenCN, MoTa) values (N'Quản lý sản phẩm', N'')
insert into CHUCNANG(TenCN, MoTa) values (N'Quản lý nhập hàng', N'')
insert into CHUCNANG(TenCN, MoTa) values (N'Quản lý chương trình khuyến mãi', N'')
insert into CHUCNANG(TenCN, MoTa) values (N'Quản lý hóa đơn', N'')
insert into CHUCNANG(TenCN, MoTa) values (N'Báo cáo thống kê', N'')

---LOAINGUOIDUNG---
insert into LOAINGUOIDUNG(TenLND, MoTa) values (N'Admin', N'')
insert into LOAINGUOIDUNG(TenLND, MoTa) values (N'Thu ngân', N'')
insert into LOAINGUOIDUNG(TenLND, MoTa) values (N'Nhân viên kho', N'')

---PHANQUYEN---
insert into PHANQUYEN(idLND, idCN) values (1, 1)
insert into PHANQUYEN(idLND, idCN) values (1, 2)
insert into PHANQUYEN(idLND, idCN) values (1, 3)
insert into PHANQUYEN(idLND, idCN) values (1, 5)
insert into PHANQUYEN(idLND, idCN) values (1, 6)
insert into PHANQUYEN(idLND, idCN) values (1, 8)
insert into PHANQUYEN(idLND, idCN) values (1, 10)

insert into PHANQUYEN(idLND, idCN) values (2, 3)
insert into PHANQUYEN(idLND, idCN) values (2, 4)
insert into PHANQUYEN(idLND, idCN) values (2, 6)
insert into PHANQUYEN(idLND, idCN) values (2, 9)

insert into PHANQUYEN(idLND, idCN) values (3, 5)
insert into PHANQUYEN(idLND, idCN) values (3, 6)
insert into PHANQUYEN(idLND, idCN) values (3, 7)

---NHANVIEN---
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Cyrille Clynman', '11/10/2022', 'Male', '000 Westport Alley', '6139484922', '01/15/2022', 'Data Coordinator', 0, 'nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis');
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Faydra Cuncarr', '06/27/1956', 'Female', '1917 Schlimgen Junction', '3016033867', '08/26/2023', 'Recruiting Manager', 1, 'lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet');
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Sher Thurske', '03/27/2018', 'Female', '7131 Norway Maple Parkway', '7027821302', '10/13/2023', 'Web Developer I', 0, null);
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Roger Le - Count', '10/10/1985', 'Male', '52028 Derek Drive', '7936504443', '05/03/2022', 'Research Nurse', 1, 'convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis');
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Brit Cheel', '04/20/1991', 'Male', '63751 Menomonie Hill', '8498994680', '04/18/2022', 'Registered Nurse', 1, 'lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue');
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Emmanuel Jachimak', '01/08/2009', 'Genderfluid', null, '6584226975', '02/11/2022', 'Chemical Engineer', 0, 'integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam');
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Tucker Johansson', '03/07/2005', 'Male', '94 Redwing Park', '7324873258', '01/31/2021', 'Quality Control Specialist', 1, null);
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Korrie Eathorne', '02/03/2022', 'Female', '0725 Erie Drive', null, '04/02/2023', 'Senior Quality Engineer', 0, 'donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat');
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Midge Deport', '12/26/2007', 'Female', '27743 5th Park', '1075852431', '11/09/2021', 'Legal Assistant', 0, '');
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Marion Bowskill', '08/26/2015', 'Male', '73730 Maryland Center', '1395439688', '12/19/2020', 'Executive Secretary', 1, null);
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Sammie Tutt', '11/18/2012', 'Male', '6 Darwin Park', '5271138301', '09/23/2022', 'Payment Adjustment Coordinator', 0, null);
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Sampson Wyard', '10/31/2022', 'Male', '463 Carberry Lane', '1464484570', '01/18/2023', 'Financial Analyst', 1, null);
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Denyse McIlenna', '01/28/1979', 'Female', '1153 Ludington Road', '2461231079', '01/01/2021', 'Systems Administrator IV', 1, null);
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Albie Lindner', '12/18/2021', 'Male', '2466 Saint Paul Junction', '7269325297', '12/24/2021', 'Help Desk Operator', 0, null);
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Coleen Hardwin', '11/13/1990', 'Female', '6323 Goodland Avenue', null, '11/29/2022', 'Financial Analyst', 0, 'libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc');
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Maurizio Robertsson', '09/02/1977', 'Male', '6927 David Terrace', '1379339786', '12/21/2020', 'Data Coordinator', 1, 'pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque');
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Simonne de Juares', '01/17/1974', 'Female', '5 Clarendon Crossing', '8322619450', '03/02/2023', 'General Manager', 1, 'posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna');
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Jaquenetta Nobles', '01/27/1971', 'Female', '3 Cardinal Pass', '8126763245', '07/27/2022', 'Research Assistant I', 0, null);
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Feliks Malinson', '06/07/1967', 'Male', '608 3rd Trail', '5279678492', '07/15/2023', 'Financial Analyst', 1, 'sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie');
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Gerick Petroff', '09/01/2013', 'Male', '59 Havey Pass', '4026720540', '01/10/2021', 'Librarian', 0, 'euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non');
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Emmy Raoul', '01/21/2012', 'Female', '147 Farwell Pass', '6658137338', '08/10/2022', 'Geologist III', 0, null);
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Nerissa Chrisp', '03/05/1955', 'Female', '17 Atwood Plaza', '1428067872', '03/09/2023', 'Software Test Engineer I', 0, 'aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac');
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Isadora Crichten', '08/09/2022', 'Female', '677 Emmet Lane', '6001241524', '07/11/2022', 'Physical Therapy Assistant', 1, 'vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede');
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Lesley Skatcher', '10/30/2004', 'Male', '9776 6th Crossing', '4762891185', '07/20/2023', 'Internal Auditor', 0, 'volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis');
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Anissa Heselwood', '04/11/1980', 'Female', null, '2835646839', '05/12/2022', 'Quality Control Specialist', 1, 'turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est');
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Deeanne Laban', '08/22/1981', 'Genderqueer', '21262 East Plaza', '7199963024', '02/10/2021', 'Database Administrator I', 1, null);
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Inigo Pietersma', '11/20/1989', 'Male', '7 Bartelt Point', '5691873437', '04/24/2023', 'Community Outreach Specialist', 1, null);
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Chaim Odcroft', '02/02/1992', 'Male', '1 Scott Center', '7162580889', '11/19/2022', 'Web Developer I', 1, null);
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Tamqrah Gerrish', '01/14/1972', 'Female', '714 Helena Alley', '1105506138', '08/26/2022', 'Actuary', 0, 'eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim');
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Leland Gopsill', '08/04/1961', 'Female', '7 Little Fleur Plaza', '2882757796', '04/23/2023', 'Social Worker', 1, null);
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Shayna Heaford', '02/29/1972', 'Bigender', '55099 Dottie Street', null, '06/17/2022', 'GIS Technical Architect', 0, null);
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Ab Holleran', '06/20/2019', 'Male', '59 Marquette Way', '2509734221', '03/07/2022', 'VP Marketing', 0, 'pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec');
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Krysta Pretorius', '06/30/2005', 'Female', '0 Hoepker Plaza', '1756207595', '10/11/2023', 'Budget/Accounting Analyst IV', 1, 'nascetur ridiculus mus vivamus vestibulum');
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Ossie Jeckell', '02/24/1972', 'Male', null, '1924410549', '11/10/2021', 'Senior Editor', 1, null);
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Felice Bayne', '06/10/1952', 'Male', '4 Moose Lane', '3207281455', '02/10/2023', 'Legal Assistant', 1, 'purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis');
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Gerhard Ackenson', '05/26/1986', 'Male', '252 Morrow Avenue', '9955214852', '02/24/2021', 'Environmental Specialist', 0, null);
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Dylan Monteath', '11/26/1987', 'Genderfluid', '16 Daystar Trail', '5944872233', '07/09/2023', 'Staff Scientist', 1, null);
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Drugi Denning', '12/16/1976', 'Male', '163 Pearson Court', '1687096958', '01/18/2022', 'Actuary', 1, 'sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue');
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Ellene Goodwill', '11/23/2002', 'Female', '1 Bartillon Parkway', '2944273149', '05/01/2022', 'Geological Engineer', 1, null);
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Yank Lipgens', '05/06/1965', 'Male', '127 Lyons Circle', '3095021704', '12/05/2022', 'Actuary', 1, null);
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Cassondra Wardingley', '08/27/2001', 'Genderfluid', '3 Gerald Park', '7376761057', '01/24/2023', 'General Manager', 1, null);
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Ninetta Rofe', '01/06/1974', 'Female', '21 Florence Crossing', '6689223108', '03/05/2021', 'Actuary', 1, null);
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Sheffield Dabling', '05/26/1959', 'Male', '5 Valley Edge Plaza', '7042297893', '02/27/2021', 'Marketing Assistant', 1, 'tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante');
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Rafa Treher', '06/06/1985', 'Female', '8 Mosinee Point', '4095322041', '05/23/2021', 'Senior Sales Associate', 1, 'vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in');
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Clemmy Parades', '01/04/2003', 'Female', '866 Darwin Way', '8626813274', '08/11/2021', 'Web Developer III', 1, null);
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Gavin Lipsett', '03/22/1951', 'Male', '34 Kropf Court', '5551157289', '11/04/2021', 'Compensation Analyst', 1, 'fusce lacus purus aliquet');
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Kary Ungerecht', '10/05/2014', 'Female', '01765 Vermont Center', '5003225164', '02/14/2022', 'Project Manager', 1, null);
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Ferdie Pankettman', '08/03/1971', 'Male', '04246 Summer Ridge Crossing', '4429517650', '07/17/2022', 'Occupational Therapist', 0, null);
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Shina Kasper', '03/27/1998', 'Female', '720 Debra Way', '9773338275', '11/29/2022', 'Project Manager', 0, 'vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla');
insert into NHANVIEN (TenNV, NgaySinh, GioiTinh, DiaChi, SDT, NgayVL, ChucVu, TinhTrang, GhiChu) values ('Elwin Shinner', '07/09/1959', 'Male', '56 Heath Drive', '7648596823', '03/09/2023', 'Physical Therapy Assistant', 0, 'lacinia nisi venenatis tristique fusce congue diam id ornare');

---NGUOIDUNG---
insert into NGUOIDUNG (TenDN, MatKhau, NgayTao, TinhTrang, idNV, idLND) values ('kfincke0', 'qS8.1B5Rb', '08/25/2022', 0, 32, 1);
insert into NGUOIDUNG (TenDN, MatKhau, NgayTao, TinhTrang, idNV, idLND) values ('csheehy1', 'wZ3''r!R9Nj0Gh#''', '10/02/2022', 1, 22, 2);
insert into NGUOIDUNG (TenDN, MatKhau, NgayTao, TinhTrang, idNV, idLND) values ('tivashkin2', 'bH5<biK%&fuy?/', '08/09/2022', 0, 24, 1);
insert into NGUOIDUNG (TenDN, MatKhau, NgayTao, TinhTrang, idNV, idLND) values ('astook3', 'jS7.#m5C', '04/14/2023', 1, 17, 1);
insert into NGUOIDUNG (TenDN, MatKhau, NgayTao, TinhTrang, idNV, idLND) values ('jmercik4', 'mV0&zY#lC"Q)?a|u', '02/24/2022', 0, 50, 2);
insert into NGUOIDUNG (TenDN, MatKhau, NgayTao, TinhTrang, idNV, idLND) values ('tlambard5', 'kI5)ZVU"Ru~P@wk5', '01/19/2021', 0, 17, 1);
insert into NGUOIDUNG (TenDN, MatKhau, NgayTao, TinhTrang, idNV, idLND) values ('kfrow6', 'oZ5?E>?w{7Df1', '04/22/2022', 0, 22, 1);
insert into NGUOIDUNG (TenDN, MatKhau, NgayTao, TinhTrang, idNV, idLND) values ('ldreini7', 'pF6!J*#a"vRzoo~', '06/10/2023', 1, 5, 3);
insert into NGUOIDUNG (TenDN, MatKhau, NgayTao, TinhTrang, idNV, idLND) values ('afynn8', 'oH7~hsIQPFf', '02/01/2022', 0, 48, 1);
insert into NGUOIDUNG (TenDN, MatKhau, NgayTao, TinhTrang, idNV, idLND) values ('morrobin9', 'qK0#/KjZwQKiQJ(', '05/16/2022', 0, 45, 1);
insert into NGUOIDUNG (TenDN, MatKhau, NgayTao, TinhTrang, idNV, idLND) values ('mpymera', 'iH2`PisjZP', '11/09/2021', 0, 6, 3);
insert into NGUOIDUNG (TenDN, MatKhau, NgayTao, TinhTrang, idNV, idLND) values ('pdauberb', 'sD8}PZ#J=pBm+v', '06/16/2023', 1, 41, 1);
insert into NGUOIDUNG (TenDN, MatKhau, NgayTao, TinhTrang, idNV, idLND) values ('variesc', 'dL8(tqx$', '08/30/2021', 0, 10, 1);
insert into NGUOIDUNG (TenDN, MatKhau, NgayTao, TinhTrang, idNV, idLND) values ('lbedderd', 'lP8#Ie3u?M''C', '02/02/2022', 0, 37, 2);
insert into NGUOIDUNG (TenDN, MatKhau, NgayTao, TinhTrang, idNV, idLND) values ('amarmyone', 'oO0$ULq"Y7$ZAcW', '07/18/2022', 0, 13, 1);
insert into NGUOIDUNG (TenDN, MatKhau, NgayTao, TinhTrang, idNV, idLND) values ('bpayfootf', 'rA2+IEKv`$/zx"', '06/29/2022', 0, 7, 1);
insert into NGUOIDUNG (TenDN, MatKhau, NgayTao, TinhTrang, idNV, idLND) values ('eryhorovichg', 'kX5&Vv53''e9LBZ}d', '08/06/2022', 1, 38, 3);
insert into NGUOIDUNG (TenDN, MatKhau, NgayTao, TinhTrang, idNV, idLND) values ('kbrymnerh', 'bG1|NE%s6oa', '01/21/2023', 0, 27, 3);
insert into NGUOIDUNG (TenDN, MatKhau, NgayTao, TinhTrang, idNV, idLND) values ('hmarsoni', 'dZ1`'')Wt?QlOQx8', '07/06/2021', 0, 34, 1);
insert into NGUOIDUNG (TenDN, MatKhau, NgayTao, TinhTrang, idNV, idLND) values ('tjunej', 'cI3$mst"ZZW|~z9v', '05/04/2022', 0, 2, 1);

---LOAIKHACHHANG---
insert into LOAIKHACHHANG(TenLKH, MoTa, DiemTichLuyToiThieu) values (N'Khách lẻ', N'', 0)
insert into LOAIKHACHHANG(TenLKH, MoTa, DiemTichLuyToiThieu) values (N'Hội viên', N'', 50)
insert into LOAIKHACHHANG(TenLKH, MoTa, DiemTichLuyToiThieu) values (N'Hội viên VIP', N'', 200)

---KHACHHANG---
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Evangelina Wehnerr', 'Female', '12/07/2001', '9942 Killdeer Way', '8534387129', '07/25/2022', 89, 2);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Rudiger Reeme', 'Male', '03/14/2006', '09748 Dottie Street', '5773362943', '12/09/2020', 29, 2);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Arlena Sprosson', 'Female', '10/20/1993', '19 Warbler Street', '1257019734', '02/23/2023', 205, 2);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Zitella Lefwich', 'Female', '11/26/1988', '4003 Division Pass', '1583828629', '07/17/2021', 161, 2);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Marena Hexum', 'Female', null, '41 Erie Way', '5968727637', '05/15/2022', 230, 2);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Ross Lavigne', 'Male', '02/05/1996', null, '3148518186', '03/09/2021', 66, 2);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Arabelle Ebbin', 'Female', '11/09/1959', '8 4th Alley', '8463502860', '12/28/2021', 147, 2);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Evey Clougher', 'Female', '12/02/1957', '1221 Tony Place', '6488090445', '11/19/2021', 202, 2);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Fransisco Lints', 'Male', '10/21/1975', '938 Lerdahl Way', '2103853200', '08/09/2021', 15, 2);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Burnaby Croley', 'Bigender', '10/28/1973', '0 Heath Junction', '8394362594', '05/13/2023', 49, 2);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Ben Braidon', 'Bigender', '09/07/2001', '961 Mayfield Avenue', '9311849601', '06/04/2023', 29, 2);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Durant Andreopolos', 'Male', '10/15/2011', '090 Barby Road', '2656155620', '06/07/2021', 30, 2);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Jelene Crowson', 'Female', '06/21/2005', '0092 Menomonie Way', '5478911698', '12/13/2022', 75, 2);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Julietta Rickword', 'Female', '09/12/1997', '7745 Scoville Way', '7796843781', '10/04/2021', 45, 2);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Thurston Tinan', 'Male', '01/05/1981', '494 Basil Circle', '6861387610', '12/02/2022', 123, 2);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Eustacia Cominoli', 'Female', '11/20/1985', '977 Forster Drive', '3048069812', '04/09/2023', 195, 2);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Bernardo Ledwitch', 'Male', '10/20/1971', '7320 Bowman Parkway', '6915915567', '12/02/2020', 174, 2);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Reube MacCrosson', 'Male', '04/05/1956', '03683 Doe Crossing Place', '4419738973', '11/11/2021', 21, 2);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Julian Nenci', 'Male', '03/05/1979', '4 Stone Corner Alley', '6157626832', '09/13/2022', 129, 2);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Jesselyn Sowley', 'Female', '05/28/1965', '6 Surrey Lane', '2472890400', '12/20/2020', 149, 2);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Emmanuel Laminman', 'Male', '03/10/2003', '0304 Kim Plaza', '2536561324', '12/21/2021', 221, 2);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Bertina Matkin', 'Female', null, '24 Karstens Park', '5909042537', '07/05/2022', 225, 2);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Hally Bartos', 'Female', '09/16/2008', '6 Toban Parkway', '7639813411', '07/27/2023', 138, 2);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Carroll Connerry', 'Male', '04/15/1953', '293 High Crossing Lane', '5338353655', '02/06/2021', 153, 2);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Steve Kohlerman', 'Male', '11/05/2016', '25 Buhler Plaza', '4869446388', '04/01/2023', 153, 2);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Ely Englishby', 'Non-binary', '07/23/2007', '34669 Packers Point', '6577318271', '05/06/2023', 992, 3);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Hatty Gorwood', 'Agender', '01/07/2011', '16 Tony Parkway', '5047459610', '09/16/2023', 776, 3);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Donia Lafont', 'Female', '06/07/2001', '92074 Lukken Junction', '5807103440', '12/02/2022', 289, 3);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Sibyl Beade', 'Male', '04/22/1998', '027 4th Circle', '3894113988', '06/05/2021', 919, 3);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Cornelle Carek', 'Female', '09/28/1957', '749 Sunfield Place', '3496924261', '03/21/2021', 257, 3);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Gaelan Tomaskunas', 'Male', '08/04/1994', '4 Westridge Court', '8374644007', '04/27/2022', 489, 3);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Flory Dominiak', 'Polygender', '09/01/1982', '90504 Holmberg Trail', '3427739220', '04/26/2023', 819, 3);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Leland Driscoll', 'Male', '06/07/2018', '4598 Express Trail', '3899270383', '02/19/2021', 682, 3);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Berton Croshaw', 'Male', null, '69 Drewry Court', '5608526858', '11/22/2021', 525, 3);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Teador Wray', 'Male', '01/30/1976', '594 Hooker Junction', '7805396331', '01/26/2022', 708, 3);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Poppy McDowall', 'Female', '08/24/2023', '7 Utah Circle', '5518156254', '06/12/2021', 363, 3);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Broddie Dresse', 'Male', '06/14/1962', '08 Moland Avenue', '2245095608', '12/02/2021', 944, 3);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Prentiss Murdy', 'Male', '07/05/1951', '8 Emmet Crossing', '1115239110', '12/18/2020', 286, 3);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Ardith Keuntje', 'Female', '06/11/1961', '44379 Golden Leaf Court', '5507704971', '12/13/2020', 641, 3);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Marijn Thoumasson', 'Male', '01/29/2002', '3758 Bunker Hill Court', '1356076215', '06/15/2023', 692, 3);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Dusty Wison', 'Female', '02/01/1965', '77081 Homewood Road', '1403307386', '07/25/2022', 662, 3);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Marge Lamprey', 'Female', '02/11/1963', '67749 Burning Wood Way', '6958066516', '07/30/2022', 485, 3);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Earvin Fagan', 'Male', null, null, '9554051338', '10/15/2022', 376, 3);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Gloriane Wickett', 'Female', '09/09/1982', '7365 Chinook Circle', '4132253573', '12/04/2022', 894, 3);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Tyrus Gosland', 'Male', null, '284 Fulton Drive', '6685992214', '09/13/2023', 707, 3);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Kit Mayoh', 'Female', '02/12/2008', '4 Park Meadow Junction', '4099648446', '12/09/2021', 273, 3);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Gene Lerhinan', 'Female', '02/24/1974', '468 Gale Junction', '7654222502', '12/07/2020', 272, 3);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Kania Bruno', 'Agender', '08/31/2004', '760 Messerschmidt Center', '1939056100', '06/23/2023', 550, 3);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Town Copes', 'Male', '08/07/1970', '65 Transport Parkway', '7903977235', '10/10/2021', 947, 3);
insert into KHACHHANG (TenKH, GioiTinh, NgaySinh, DiaChi, SDT, NgayTG, DiemTichLuy, idLKH) values ('Myranda Wickman', 'Female', '05/12/2014', '6444 Johnson Hill', '9202199475', '01/22/2023', 797, 3);

---DANHMUC---
insert into DANHMUC (TenDM, MoTa) values (N'Sách trong nước', N'')
insert into DANHMUC (TenDM, MoTa) values (N'Foreign Books', N'')
insert into DANHMUC (TenDM, MoTa) values (N'Văn phòng phẩm', N'')
insert into DANHMUC (TenDM, MoTa) values (N'Đồ chơi', N'')
insert into DANHMUC (TenDM, MoTa) values (N'Làm đẹp sức khỏe', N'')
insert into DANHMUC (TenDM, MoTa) values (N'Hành trang đến trường', N'')
insert into DANHMUC (TenDM, MoTa) values (N'Bách hóa lưu niệm', N'')
insert into DANHMUC (TenDM, MoTa) values (N'Sách ngoại văn', N'')

-----DONVITINH---
--insert into DONVITINH (TenDVT) values (N'Cây')
--insert into DONVITINH (TenDVT) values (N'Quyển')
--insert into DONVITINH (TenDVT) values (N'Chiếc')
--insert into DONVITINH (TenDVT) values (N'Cái')
--insert into DONVITINH (TenDVT) values (N'')

---SANPHAM---
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Smoked Tongue', 'nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec', null, 5);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Tequila Rose Cream Liquor', 'pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac', null, 4);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Sprouts - Pea', 'in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id', 'tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus', 2);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Wonton Wrappers', 'magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere', null, 7);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Milk Powder', null, null, 3);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Squash - Acorn', 'in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur', 'at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut', 7);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Wine - Piper Heidsieck Brut', 'sapien non mi integer ac neque duis bibendum morbi non quam', null, 5);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Cake - Bande Of Fruit', 'non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida', null, 5);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Table Cloth 120 Round White', 'quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet', null, 5);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Beans - Butter Lrg Lima', 'auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est', null, 8);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Daves Island Stinger', 'quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia', null, 6);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Wine - Prem Select Charddonany', 'justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis', 'convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin', 6);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Avocado', 'ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue', 'diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue', 2);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Alize Gold Passion', 'nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel', null, 4);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Creamers - 10%', 'est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna', 'eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu', 8);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Tomato - Plum With Basil', 'convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac', 'erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas', 1);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Steampan - Half Size Shallow', 'at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis', null, 8);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Steel Wool', 'pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque', 'tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante', 8);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Water - Mineral, Carbonated', 'eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo', 'bibendum morbi non quam nec dui luctus rutrum nulla tellus in', 7);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Cake - Dulce De Leche', 'nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue', null, 1);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Napkin - Beverage 1 Ply', null, 'sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices', 3);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Wine - Bouchard La Vignee Pinot', 'orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque', null, 6);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Pectin', 'libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras', 'at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem', 8);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Lotus Rootlets - Canned', 'donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut', 'id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit', 7);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Tomato - Green', 'posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis', null, 4);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Oysters - Smoked', 'nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra', null, 7);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Sauce - Soya, Light', 'eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed', null, 4);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Taro Leaves', 'tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante', 'posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin', 3);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Wine - Red, Cabernet Sauvignon', 'a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla', 'lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a', 6);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Pork - Side Ribs', null, null, 3);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Wine - Magnotta - Cab Sauv', 'justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate', null, 3);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Mace Ground', null, 'cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc', 6);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Puree - Kiwi', 'metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet', null, 5);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Cookie Dough - Chunky', 'tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan', null, 8);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Cake - Cheese Cake 9 Inch', 'mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id', null, 7);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Compound - Strawberry', 'eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam', 'curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi', 2);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Beef - Rouladin, Sliced', 'dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis', null, 6);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Turkey - Breast, Bone - In', null, 'metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris', 5);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Cheese - Gouda Smoked', null, 'sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus', 6);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Danishes - Mini Raspberry', 'habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida', 'vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper', 8);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Vector Energy Bar', 'turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede', null, 3);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Muffin - Blueberry Individual', 'sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus', 'vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at', 1);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Sauerkraut', 'porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse', 'amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat', 5);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Iced Tea - Lemon, 340ml', 'quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec', 'ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus', 8);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Curry Powder', 'faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras', null, 2);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Cloves - Whole', 'consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien', null, 5);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Venison - Denver Leg Boneless', null, null, 1);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Mushroom - Shitake, Fresh', null, 'sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum', 1);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Milk - Skim', 'eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum', 'lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat', 5);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Sauce - White, Mix', 'nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut', null, 8);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Beef - Ox Tongue, Pickled', null, 'faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare', 7);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Cup - 8oz Coffee Perforated', 'in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem', null, 7);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Wine - White, Schroder And Schyl', null, null, 4);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Milk - Buttermilk', 'mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec', null, 3);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Otomegusa Dashi Konbu', 'mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum', 'massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in', 5);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Anisette - Mcguiness', 'eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh', null, 5);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Sole - Fillet', 'dolor sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi', 'eu felis fusce posuere felis sed lacus morbi sem mauris laoreet', 5);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Cheese - Brie Roitelet', 'commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus', 'dui proin leo odio porttitor id consequat in consequat ut nulla', 2);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Bread - Assorted Rolls', null, null, 7);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Tofu - Soft', 'in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci', 'aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero', 7);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Bread - Italian Corn Meal Poly', null, 'lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in', 6);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Oregano - Dry, Rubbed', 'habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum', 'volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in', 3);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Scallop - St. Jaques', null, null, 2);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Muffin Orange Individual', null, 'neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh', 8);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Flavouring - Raspberry', 'at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in', 'lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet', 2);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Milk 2% 500 Ml', 'pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec', null, 1);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Skirt - 29 Foot', 'eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla', 'bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio', 4);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Turnip - Wax', 'scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at', null, 7);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Red Currant Jelly', 'bibendum morbi non quam nec dui luctus rutrum nulla tellus', 'pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at', 1);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Nut - Chestnuts, Whole', 'nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget', null, 3);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Grenadine', null, null, 8);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Rice - Sushi', 'pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor', null, 6);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Roe - White Fish', null, null, 2);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Oil - Avocado', 'est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet', 'mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan', 2);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Jolt Cola - Electric Blue', 'at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices', null, 8);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Ginger - Ground', 'sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie', null, 3);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Ginger - Pickled', 'pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla', null, 4);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Horseradish - Prepared', 'at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit', 'porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu', 5);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Cloves - Whole', 'nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla', null, 5);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Lamb Shoulder Boneless Nz', 'interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor', 'mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus', 8);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Juice - Orange, 341 Ml', 'dapibus nulla suscipit ligula in lacus curabitur at ipsum ac', 'dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam', 1);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Wine - White, French Cross', 'ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu', null, 4);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Trout Rainbow Whole', null, null, 3);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Ostrich - Fan Fillet', 'rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa', null, 7);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Kolrabi', null, 'pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis', 3);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Coriander - Seed', 'nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet', null, 7);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Wine - Dubouef Macon - Villages', 'vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula', null, 3);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Soup - Base Broth Chix', 'condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus', null, 2);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Sachet', 'amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec', null, 2);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Crackers - Trio', 'id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci', 'magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in', 8);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Flour - Pastry', null, null, 7);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Lamb - Whole, Frozen', 'condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies', 'eleifend quam a odio in hac habitasse platea dictumst maecenas ut', 7);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Doilies - 7, Paper', 'donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius', 'enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero', 4);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Beer - Creemore', 'felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam', null, 2);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Coffee Swiss Choc Almond', 'sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst', 'vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue', 1);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Beef - Ox Tail, Frozen', 'amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis', null, 6);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Pork - Bacon, Double Smoked', 'nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam', null, 5);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Container - Clear 16 Oz', 'et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit', null, 5);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Wine - Harrow Estates, Vidal', 'vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec', 'mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl', 6);
insert into SANPHAM (TenSP, MoTa, GhiChu, idDM) values ('Persimmons', 'erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis', null, 8);

---NHAPHANG---
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('1/11/2022', 8707419814, null, 18);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('3/8/2022', 7718097767, null, 5);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('8/13/2021', 467722187, 'dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum', 1);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('4/20/2021', 7271173671, null, 6);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('12/19/2021', 7181977778, null, 6);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('10/17/2021', 8421848118, 'odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac', 9);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('5/13/2021', 2614694407, null, 8);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('5/3/2022', 915275911, null, 1);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('5/17/2021', 3569594823, 'sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero', 1);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('3/25/2021', 9833296772, null, 17);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('10/16/2022', 8540038401, null, 3);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('2/25/2023', 1264009369, 'lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl', 13);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('11/8/2022', 6402333961, 'sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac', 1);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('11/17/2022', 6072866648, 'et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim', 12);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('12/24/2022', 9865219958, null, 1);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('4/28/2023', 5363982330, 'nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus', 14);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('10/15/2023', 6176843997, null, 5);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('10/30/2021', 6815258052, null, 2);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('4/17/2023', 4580154273, null, 9);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('6/10/2023', 6237222725, null, 8);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('7/14/2021', 4341234043, null, 15);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('9/21/2021', 7620893846, null, 8);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('12/4/2022', 2242274947, 'tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum', 2);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('7/25/2023', 4674569937, 'vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo', 10);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('8/15/2021', 4220973889, 'nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum', 5);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('8/16/2022', 465371375, null, 5);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('7/22/2021', 3783793144, null, 2);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('9/2/2022', 4488093226, null, 14);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('12/24/2021', 5363220610, 'eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer', 18);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('1/1/2021', 8827977186, null, 12);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('9/10/2022', 3632684942, 'eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus', 11);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('6/27/2021', 7707029551, null, 14);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('2/13/2021', 4405604215, null, 7);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('6/4/2022', 2507452405, 'dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes', 1);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('8/23/2021', 4903390744, 'aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque', 16);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('6/22/2023', 7990750353, null, 12);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('7/17/2021', 1373532065, null, 1);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('2/14/2022', 8539038326, null, 13);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('10/5/2023', 26183745, null, 15);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('2/22/2023', 7891802051, null, 2);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('12/27/2021', 245278797, null, 11);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('7/9/2022', 6595938793, null, 16);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('1/30/2023', 549620421, 'nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices', 13);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('4/8/2022', 495763026, 'aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl', 11);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('1/23/2021', 5548626044, 'turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis', 3);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('3/4/2021', 841832664, 'nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue', 13);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('11/17/2022', 9440079811, null, 20);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('3/16/2023', 1910694469, null, 6);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('11/20/2022', 7665844069, null, 12);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('6/11/2022', 5243269727, null, 4);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('12/16/2021', 7846808265, null, 1);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('4/9/2021', 4768728692, null, 8);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('7/15/2021', 2323392273, null, 1);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('7/18/2022', 19029362, 'nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat', 19);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('9/27/2022', 8130172902, 'neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices', 17);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('4/2/2023', 7994510792, 'potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer', 13);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('7/23/2021', 8692340332, null, 20);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('7/21/2021', 7939580662, null, 15);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('7/20/2021', 5617820427, null, 8);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('5/20/2021', 3639170761, 'porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales', 16);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('2/28/2023', 6384563704, 'cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper', 8);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('3/11/2021', 5516627082, 'tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam', 14);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('3/21/2023', 1819997146, null, 8);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('11/30/2021', 7839839140, null, 5);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('12/25/2021', 6052149442, null, 7);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('12/10/2022', 751951404, null, 18);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('12/26/2022', 7468846911, null, 20);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('5/11/2021', 7359041054, 'tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam', 17);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('4/19/2023', 7657147088, 'quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam', 10);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('3/7/2021', 7638342613, 'pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin', 14);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('2/15/2023', 7700510683, 'cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi', 15);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('6/30/2021', 7003429381, 'mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac', 7);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('6/20/2022', 8060703775, 'volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient', 15);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('12/26/2022', 8550881404, null, 2);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('5/22/2021', 515195625, 'venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero', 1);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('11/16/2021', 6691820884, null, 5);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('7/24/2021', 9610667347, null, 20);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('2/25/2022', 874731821, null, 14);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('8/10/2023', 481695962, 'nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum', 11);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('10/9/2021', 9199656410, 'massa volutpat convallis morbi odio odio elementum eu interdum eu', 7);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('1/11/2023', 5384342147, null, 12);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('5/25/2021', 4310223165, null, 5);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('5/7/2023', 1423388950, null, 3);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('9/9/2023', 3383807507, 'convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus', 2);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('4/21/2021', 5216075566, null, 16);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('7/22/2021', 824263789, null, 10);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('7/9/2021', 6862565496, 'faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut', 14);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('5/11/2022', 7160739157, 'sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean', 9);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('6/20/2022', 5579909062, 'velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in', 3);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('5/24/2021', 9409653282, null, 1);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('4/19/2023', 1361410079, null, 6);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('3/1/2023', 5421822451, null, 20);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('12/4/2022', 1372692368, null, 20);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('11/18/2022', 3745985945, 'convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo', 12);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('11/1/2020', 1365636356, 'dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus', 4);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('3/19/2022', 5114561639, 'vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis', 11);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('6/1/2023', 1694758786, 'quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque', 5);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('3/26/2022', 6286752285, null, 16);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('3/29/2022', 3061837289, null, 16);
insert into NHAPHANG (NgayNhap, ThanhTien, GhiChu, idND) values ('10/6/2021', 6613337895, null, 13);

---CTSP---
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (494201, 5, 2, 843984, 40, 8, 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor', 3, 21, 25);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (521039, 71, 9, 566563, 89, 50, null, 0, 34, 61);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (536576, 82, 7, 62383, 10, 45, null, 2, 51, 80);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (512795, 46, 2, 956417, 88, 50, 'aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat', 2, 97, 17);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (914017, 63, 6, 78741, 73, 33, null, 0, 11, 95);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (202968, 60, 3, 783772, 75, 33, 'tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in', 1, 24, 25);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (31407, 68, 10, 916188, 60, 11, 'posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum', 1, 56, 66);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (501941, 75, 6, 925411, 41, 10, 'montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et', 1, 1, 56);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (152724, 7, 2, 594841, 89, 31, 'duis at velit eu est congue elementum in hac habitasse platea', 1, 77, 74);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (824865, 80, 6, 799248, 81, 30, 'at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse', 2, 97, 20);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (952934, 62, 1, 960858, 77, 6, 'lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare', 1, 88, 72);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (719185, 44, 7, 748972, 39, 42, null, 3, 71, 84);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (711378, 80, 1, 254866, 21, 48, null, 2, 87, 5);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (409101, 40, 3, 526044, 75, 19, 'montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient', 1, 79, 100);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (587033, 44, 2, 488262, 21, 33, 'porttitor pede justo eu massa donec dapibus duis at velit eu est congue', 1, 95, 20);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (255713, 55, 2, 724171, 35, 50, 'velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta', 0, 95, 5);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (730665, 43, 8, 258101, 3, 50, null, 0, 86, 91);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (981571, 5, 8, 910943, 36, 19, 'venenatis turpis enim blandit mi in porttitor pede justo eu', 1, 59, 24);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (46857, 4, 8, 75507, 100, 37, null, 3, 46, 16);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (864258, 97, 1, 390453, 17, 11, 'at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget', 0, 37, 41);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (104792, 13, 3, 812266, 92, 26, 'congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue', 3, 41, 74);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (356260, 37, 1, 590859, 84, 41, null, 3, 19, 26);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (758943, 70, 9, 203654, 62, 37, null, 0, 42, 24);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (26199, 16, 10, 147812, 52, 46, null, 0, 65, 37);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (569879, 14, 3, 990908, 87, 8, null, 1, 10, 55);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (799932, 17, 3, 348717, 68, 6, 'libero nam dui proin leo odio porttitor id consequat in', 0, 100, 24);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (527710, 20, 7, 809515, 48, 3, null, 2, 64, 91);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (736273, 13, 10, 224934, 99, 40, null, 0, 25, 54);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (724281, 85, 6, 504423, 18, 31, null, 2, 27, 44);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (484723, 89, 5, 343001, 96, 5, null, 1, 56, 25);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (122566, 76, 8, 739786, 69, 20, null, 1, 9, 34);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (764815, 69, 6, 655905, 78, 26, null, 1, 19, 41);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (860352, 50, 2, 727138, 67, 3, null, 3, 44, 35);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (223839, 100, 7, 640426, 34, 11, null, 1, 18, 75);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (74227, 87, 10, 164072, 11, 43, 'metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget', 3, 66, 94);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (253972, 12, 6, 992303, 5, 8, 'parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis', 3, 47, 11);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (205185, 56, 7, 299927, 59, 37, 'justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio', 3, 48, 90);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (636730, 4, 4, 136283, 39, 13, 'venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar', 2, 42, 55);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (813553, 79, 4, 292743, 52, 15, null, 2, 17, 22);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (740033, 3, 8, 406624, 14, 6, null, 2, 79, 87);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (364898, 26, 10, 962739, 47, 10, 'tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh', 2, 76, 90);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (785346, 41, 7, 55444, 1, 15, 'metus aenean fermentum donec ut mauris eget massa tempor convallis nulla', 2, 34, 97);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (678011, 53, 3, 719089, 50, 27, 'donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices', 3, 93, 98);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (62542, 49, 7, 967464, 15, 37, null, 0, 24, 31);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (170843, 58, 3, 701415, 46, 45, null, 2, 6, 22);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (728260, 63, 7, 975028, 72, 18, null, 2, 18, 95);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (767314, 5, 8, 74575, 54, 39, 'curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis', 0, 47, 18);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (519438, 75, 7, 895490, 31, 7, null, 2, 90, 53);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (249766, 11, 9, 120175, 82, 49, 'amet eros suspendisse accumsan tortor quis turpis sed ante vivamus', 0, 43, 91);
insert into CTSP (DonGiaNhap, SoLuongNhap, SoLuongLoi, DonGiaXuat, DaBan, SLConLai, GhiChu, TinhTrang, idSP, idNH) values (899009, 4, 10, 999742, 47, 8, 'nisl aenean lectus pellentesque eget nunc donec quis orci eget orci', 3, 82, 32);

---KHUYENMAI---
insert into KHUYENMAI (TenKM, MoTa, idLKH, NgayBD, NgayKT, GiamGia, idND) values ('Action|Crime|Thriller', null, 2, '9/4/2023', '10/24/2023', 80, 18);
insert into KHUYENMAI (TenKM, MoTa, idLKH, NgayBD, NgayKT, GiamGia, idND) values ('Action|Crime|Thriller', null, 3, '11/8/2022', '8/17/2023', 88, 10);
insert into KHUYENMAI (TenKM, MoTa, idLKH, NgayBD, NgayKT, GiamGia, idND) values ('Drama|War', null, 3, '5/25/2023', '5/28/2023', 13, 4);
insert into KHUYENMAI (TenKM, MoTa, idLKH, NgayBD, NgayKT, GiamGia, idND) values ('Adventure|Sci-Fi', 'in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit', 1, '6/15/2023', '5/31/2023', 64, 6);
insert into KHUYENMAI (TenKM, MoTa, idLKH, NgayBD, NgayKT, GiamGia, idND) values ('War', null, 1, '8/30/2023', '5/23/2023', 56, 7);
insert into KHUYENMAI (TenKM, MoTa, idLKH, NgayBD, NgayKT, GiamGia, idND) values ('Action|Horror|Thriller', null, 1, '8/7/2023', '3/6/2023', 39, 8);
insert into KHUYENMAI (TenKM, MoTa, idLKH, NgayBD, NgayKT, GiamGia, idND) values ('Crime|Drama', null, 3, '9/21/2023', '3/24/2023', 88, 16);
insert into KHUYENMAI (TenKM, MoTa, idLKH, NgayBD, NgayKT, GiamGia, idND) values ('Drama|Romance', null, 2, '2/12/2023', '2/2/2023', 76, 4);
insert into KHUYENMAI (TenKM, MoTa, idLKH, NgayBD, NgayKT, GiamGia, idND) values ('Comedy', 'in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque', 3, '7/5/2023', '6/17/2023', 22, 19);
insert into KHUYENMAI (TenKM, MoTa, idLKH, NgayBD, NgayKT, GiamGia, idND) values ('Documentary', null, 2, '8/22/2023', '10/8/2023', 4, 11);
insert into KHUYENMAI (TenKM, MoTa, idLKH, NgayBD, NgayKT, GiamGia, idND) values ('Documentary', 'ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus', 3, '3/28/2023', '5/1/2023', 5, 13);
insert into KHUYENMAI (TenKM, MoTa, idLKH, NgayBD, NgayKT, GiamGia, idND) values ('Drama|Romance', 'rutrum ac lobortis vel dapibus at diam nam tristique tortor', 2, '12/25/2022', '8/1/2023', 98, 1);
insert into KHUYENMAI (TenKM, MoTa, idLKH, NgayBD, NgayKT, GiamGia, idND) values ('Drama|Romance', null, 2, '6/29/2023', '8/31/2023', 41, 13);
insert into KHUYENMAI (TenKM, MoTa, idLKH, NgayBD, NgayKT, GiamGia, idND) values ('Documentary', null, 1, '10/29/2022', '10/29/2022', 99, 17);
insert into KHUYENMAI (TenKM, MoTa, idLKH, NgayBD, NgayKT, GiamGia, idND) values ('Action|Comedy', 'tempus vel pede morbi porttitor lorem id ligula suspendisse ornare', 2, '10/30/2022', '10/22/2023', 95, 9);
insert into KHUYENMAI (TenKM, MoTa, idLKH, NgayBD, NgayKT, GiamGia, idND) values ('Mystery|Thriller', null, 3, '5/30/2023', '6/28/2023', 60, 8);
insert into KHUYENMAI (TenKM, MoTa, idLKH, NgayBD, NgayKT, GiamGia, idND) values ('Drama', 'hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie', 1, '8/16/2023', '6/13/2023', 38, 6);
insert into KHUYENMAI (TenKM, MoTa, idLKH, NgayBD, NgayKT, GiamGia, idND) values ('Children', null, 2, '2/23/2023', '7/20/2023', 89, 16);
insert into KHUYENMAI (TenKM, MoTa, idLKH, NgayBD, NgayKT, GiamGia, idND) values ('Action|Adventure|Crime|Drama|Mystery|Thriller', 'amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam nam', 2, '9/15/2023', '9/29/2023', 42, 18);
insert into KHUYENMAI (TenKM, MoTa, idLKH, NgayBD, NgayKT, GiamGia, idND) values ('(no genres listed)', null, 2, '3/15/2023', '12/10/2022', 4, 8);

---PTTHANHTOAN---
insert into PTTHANHTOAN (TenPT, MoTa) values (N'Tiền mặt', N'')
insert into PTTHANHTOAN (TenPT, MoTa) values (N'MoMo', N'')
insert into PTTHANHTOAN (TenPT, MoTa) values (N'Ngân hàng', N'')
insert into PTTHANHTOAN (TenPT, MoTa) values (N'ZaloPay', N'')

---HOADON---
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('6/26/2023', 111393, 6253847, 'eu magna vulputate luctus cum sociis natoque penatibus et magnis', 2, 1, 18, 3, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('6/24/2023', 603934, 3089024, null, 1, 28, 18, 20, 1);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('3/5/2023', 180584, 7111211, 'luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit', 3, 47, 16, 5, 4);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('9/25/2023', 919395, 3657802, 'accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet', 2, 34, 5, 3, 4);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('3/31/2023', 375894, 3596837, null, 2, 19, 19, 12, 4);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('1/9/2023', 595613, 5939047, 'vivamus in felis eu sapien cursus vestibulum proin eu mi nulla', 2, 21, 5, 1, 1);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('1/10/2023', 928300, 696289, 'malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit', 2, 19, 14, 7, 1);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('8/18/2023', 669725, 3292007, 'ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit', 1, 21, 18, 7, 1);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('10/24/2023', 837537, 3617028, null, 3, 26, 17, 15, 4);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('9/9/2023', 495491, 3224413, null, 2, 8, 5, 10, 4);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('12/14/2022', 105216, 4697840, 'congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla', 3, 27, 9, 18, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('6/28/2023', 869953, 9706304, 'nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio', 3, 29, 15, 5, 4);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('5/10/2023', 206134, 455304, 'nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi', 1, 40, 8, 9, 4);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('3/10/2023', 87995, 7758150, null, 2, 41, 1, 5, 4);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('4/15/2023', 461271, 9280129, null, 1, 19, 15, 15, 4);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('11/26/2022', 210027, 8840721, null, 1, 20, 18, 16, 1);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('1/30/2023', 317268, 3448482, null, 2, 9, 18, 2, 1);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('11/16/2022', 676024, 6500884, 'duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate', 3, 42, 5, 12, 1);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('10/22/2023', 663283, 5771182, 'in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor', 1, 16, 1, 13, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('2/1/2023', 980387, 5082353, null, 3, 13, 8, 6, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('9/13/2023', 903007, 2639914, 'ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus', 3, 2, 3, 8, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('6/15/2023', 101500, 659968, 'lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo', 1, 11, 14, 2, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('9/22/2023', 661010, 9016653, null, 3, 32, 16, 5, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('8/5/2023', 394069, 3666129, 'integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in', 3, 11, 9, 16, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('7/15/2023', 381952, 412639, null, 1, 20, 20, 2, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('3/8/2023', 33312, 5786189, null, 3, 1, 2, 20, 4);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('1/4/2023', 30422, 1967144, null, 1, 39, 6, 1, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('4/5/2023', 170227, 2395595, 'in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin', 2, 43, 15, 16, 1);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('2/27/2023', 794425, 7891788, null, 3, 47, 3, 3, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('8/18/2023', 878556, 8958671, null, 3, 33, 3, 11, 1);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('2/23/2023', 74421, 8439836, null, 2, 10, 3, 15, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('9/14/2023', 502578, 1771690, null, 1, 48, 3, 9, 4);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('2/15/2023', 696077, 5813636, null, 1, 26, 18, 20, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('12/4/2022', 744572, 3636780, null, 1, 18, 19, 11, 4);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('10/30/2022', 683213, 778880, null, 3, 44, 2, 14, 4);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('10/6/2023', 663458, 4194923, null, 2, 25, 8, 11, 4);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('7/8/2023', 500060, 78168, 'consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices', 3, 18, 14, 6, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('11/8/2022', 429316, 9942035, 'dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum', 1, 49, 3, 19, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('8/20/2023', 800953, 6744777, null, 2, 4, 8, 16, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('6/3/2023', 705594, 1653323, 'orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus', 2, 31, 6, 7, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('6/29/2023', 411075, 8829924, 'metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci', 2, 4, 4, 16, 4);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('12/11/2022', 821557, 5232874, null, 3, 50, 18, 7, 1);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('2/22/2023', 939063, 7656904, null, 3, 30, 2, 15, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('11/11/2022', 584249, 2316636, null, 2, 7, 17, 14, 1);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('6/5/2023', 903917, 6842968, 'vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo', 1, 28, 16, 15, 1);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('9/22/2023', 621032, 204367, null, 1, 29, 7, 14, 4);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('8/21/2023', 25700, 5173016, null, 2, 13, 1, 8, 4);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('1/11/2023', 389309, 2392690, null, 1, 2, 4, 4, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('7/2/2023', 414030, 7197263, null, 3, 4, 17, 10, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('9/23/2023', 868771, 7845557, null, 2, 9, 16, 20, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('6/10/2023', 179772, 5033986, 'nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras', 2, 23, 15, 2, 1);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('2/25/2023', 536291, 886357, null, 2, 40, 6, 6, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('11/19/2022', 787054, 4115631, 'lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse', 3, 22, 9, 13, 4);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('1/3/2023', 983773, 4779542, 'ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue', 2, 33, 10, 11, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('5/6/2023', 186711, 5006629, 'morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in', 1, 39, 6, 10, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('1/22/2023', 711714, 5158673, 'sapien non mi integer ac neque duis bibendum morbi non quam nec dui', 2, 9, 2, 7, 4);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('9/28/2023', 630121, 8007240, 'ipsum dolor sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non', 2, 13, 9, 12, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('12/27/2022', 740913, 336265, null, 3, 28, 14, 10, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('11/26/2022', 985726, 8225164, 'posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna', 3, 26, 14, 8, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('10/4/2023', 933117, 8762262, 'nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie', 2, 38, 19, 8, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('4/12/2023', 129549, 4525963, 'nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse', 1, 12, 6, 6, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('3/24/2023', 729680, 4543157, 'pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque', 1, 44, 7, 2, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('3/19/2023', 661082, 5192888, null, 1, 48, 10, 3, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('3/24/2023', 611536, 5813711, null, 2, 1, 6, 1, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('9/24/2023', 82561, 3732938, 'non lectus aliquam sit amet diam in magna bibendum imperdiet', 2, 24, 10, 6, 4);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('10/3/2023', 112305, 2624352, null, 2, 31, 14, 13, 4);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('8/27/2023', 709796, 9954310, 'integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis', 1, 9, 2, 8, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('2/8/2023', 993503, 2053745, 'ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam', 1, 30, 8, 7, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('1/26/2023', 806723, 4303632, null, 1, 44, 12, 19, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('8/3/2023', 337998, 4284107, null, 1, 48, 19, 17, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('9/4/2023', 189108, 1439783, 'tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu', 2, 5, 4, 13, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('5/26/2023', 36842, 9089112, null, 2, 18, 19, 5, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('7/2/2023', 9070, 2678641, null, 1, 5, 16, 1, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('1/6/2023', 406968, 4027397, 'id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo', 3, 19, 13, 16, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('7/2/2023', 121754, 6563975, 'convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque', 1, 7, 16, 11, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('8/29/2023', 985772, 1532325, 'pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis', 2, 18, 11, 14, 1);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('1/31/2023', 850661, 6692892, null, 1, 48, 19, 14, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('6/20/2023', 223957, 972047, null, 1, 3, 8, 14, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('4/22/2023', 462419, 5151441, 'justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est', 1, 23, 1, 14, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('3/2/2023', 93912, 5759924, null, 3, 10, 11, 2, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('9/20/2023', 596669, 6869199, 'quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor', 2, 25, 6, 15, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('1/21/2023', 116239, 1198432, null, 2, 2, 16, 9, 1);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('2/17/2023', 527775, 9473936, 'sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam nam tristique tortor eu pede', 2, 14, 13, 15, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('4/27/2023', 106283, 2496176, null, 3, 7, 19, 3, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('9/21/2023', 931952, 253834, 'rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id', 1, 33, 5, 17, 4);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('8/25/2023', 764247, 2351837, null, 3, 8, 9, 15, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('11/3/2022', 897627, 1005329, 'libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a', 2, 39, 8, 8, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('12/18/2022', 305691, 4231059, null, 1, 11, 19, 19, 1);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('9/7/2023', 684539, 4673283, 'in congue etiam justo etiam pretium iaculis justo in hac habitasse platea', 1, 49, 13, 15, 4);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('2/13/2023', 783825, 4906759, null, 1, 42, 8, 16, 4);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('7/16/2023', 287999, 8423471, null, 1, 43, 20, 20, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('6/10/2023', 620224, 8916666, 'neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices', 1, 38, 4, 17, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('7/18/2023', 792000, 7174675, null, 2, 35, 16, 15, 4);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('6/4/2023', 100550, 8369397, 'magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur', 3, 26, 10, 19, 4);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('3/19/2023', 146045, 856497, 'ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit', 3, 7, 3, 12, 1);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('10/28/2023', 165027, 305607, 'ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere', 2, 45, 8, 17, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('12/20/2022', 94564, 4998457, 'molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper', 3, 8, 6, 9, 3);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('5/28/2023', 394504, 7693125, 'sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui', 3, 36, 2, 5, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('11/21/2022', 716717, 7086491, null, 1, 18, 1, 10, 2);
insert into HOADON (NgayHD, GiamGia, ThanhTien, GhiChu, idLKH, idKH, idKM, idND, idPT) values ('7/10/2023', 765140, 7509192, null, 3, 19, 11, 1, 3);

---CTHD---
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (14, 12, 32, 702631, 42287, 9, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (67, 20, 52, 503183, 94658, 5, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (94, 32, 96, 397232, 39346, 14, 'viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (86, 45, 34, 225424, 10676, 4, 'mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (90, 42, 83, 300420, 63410, 1, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (21, 24, 54, 730412, 89971, 16, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (2, 2, 62, 943772, 98289, 11, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (25, 6, 76, 919472, 90846, 13, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (79, 33, 100, 751217, 84252, 5, 'vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (72, 26, 69, 623708, 95009, 6, 'amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (96, 41, 24, 964717, 25287, 11, 'aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (93, 23, 12, 924910, 57823, 3, 'eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (81, 1, 91, 184344, 10672, 17, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (98, 18, 75, 357301, 1140, 20, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (18, 33, 4, 596848, 39339, 15, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (21, 25, 36, 758881, 67740, 20, 'natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (22, 17, 42, 586245, 55332, 8, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (80, 41, 29, 625639, 96031, 3, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (87, 22, 32, 637007, 21960, 17, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (94, 50, 75, 942912, 98811, 3, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (80, 25, 18, 682511, 5765, 17, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (22, 23, 87, 777922, 65180, 1, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (54, 21, 96, 995358, 77360, 6, 'justo in hac habitasse platea dictumst etiam faucibus cursus urna ut');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (39, 46, 41, 318201, 8911, 16, 'odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (99, 29, 40, 955445, 27023, 9, 'aliquam quis turpis eget elit sodales scelerisque mauris sit amet');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (60, 8, 71, 488659, 29174, 5, 'vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (71, 44, 56, 682957, 89689, 1, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (72, 31, 94, 222844, 6475, 20, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (87, 48, 38, 459303, 81232, 20, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (98, 45, 29, 591470, 2087, 19, 'in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (70, 49, 68, 235829, 66858, 19, 'neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (76, 27, 48, 839866, 8029, 16, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (66, 28, 48, 101657, 56346, 11, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (41, 36, 56, 856486, 95814, 11, 'nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (16, 15, 10, 173089, 94423, 13, 'luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (87, 25, 54, 456431, 16085, 19, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (40, 9, 7, 965694, 83445, 6, 'sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (42, 50, 50, 296527, 32705, 11, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (96, 14, 88, 718052, 97447, 10, 'pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (1, 18, 56, 347095, 11909, 16, 'vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (47, 42, 80, 490018, 68985, 20, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (36, 45, 24, 959100, 36049, 19, 'ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (100, 18, 22, 800489, 7938, 6, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (56, 7, 39, 115701, 90325, 9, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (30, 35, 6, 656698, 26493, 12, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (83, 28, 75, 643584, 70100, 6, 'proin interdum mauris non ligula pellentesque ultrices phasellus id sapien');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (61, 25, 1, 777050, 72526, 5, 'accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (7, 19, 53, 867985, 2407, 4, 'luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (29, 35, 43, 626362, 25248, 6, 'mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (57, 31, 79, 56293, 77694, 20, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (8, 49, 64, 47677, 74344, 1, 'sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (87, 31, 16, 168833, 70071, 19, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (92, 8, 5, 574825, 94815, 14, 'ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (16, 39, 93, 815215, 64856, 4, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (64, 10, 63, 76022, 16798, 4, 'ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (24, 7, 78, 656017, 79688, 20, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (3, 47, 29, 507709, 36781, 18, 'natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (87, 20, 26, 381190, 61133, 14, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (38, 19, 9, 923318, 86837, 6, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (58, 38, 12, 821545, 87796, 15, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (91, 1, 38, 156410, 51824, 2, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (6, 20, 30, 657357, 38647, 7, 'at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (83, 9, 4, 841936, 50607, 14, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (85, 33, 32, 499567, 59474, 18, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (54, 44, 26, 313746, 66731, 13, 'pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (14, 32, 31, 805098, 23027, 6, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (48, 44, 9, 426901, 71025, 15, 'luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (75, 25, 57, 637823, 76003, 11, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (93, 25, 84, 796871, 78508, 12, 'erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (51, 24, 11, 612944, 83868, 9, 'mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (64, 47, 25, 118765, 56680, 9, 'pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (46, 42, 67, 928853, 95560, 4, 'eget massa tempor convallis nulla neque libero convallis eget eleifend');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (18, 39, 32, 958996, 98588, 14, 'lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (11, 33, 64, 743656, 41205, 5, 'odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (61, 28, 50, 321851, 22579, 5, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (86, 14, 39, 255094, 68565, 9, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (58, 24, 10, 771965, 33366, 4, 'vel nisl duis ac nibh fusce lacus purus aliquet at feugiat');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (77, 31, 22, 296000, 52344, 2, 'porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (45, 26, 36, 755856, 63671, 16, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (14, 43, 58, 622569, 45352, 6, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (26, 22, 6, 143000, 70693, 17, 'nulla integer pede justo lacinia eget tincidunt eget tempus vel pede');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (71, 45, 72, 190747, 12782, 1, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (47, 41, 86, 839449, 11524, 2, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (3, 40, 41, 712019, 88492, 1, 'vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (67, 26, 77, 362467, 33540, 12, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (46, 4, 88, 808277, 53537, 15, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (57, 10, 95, 608187, 51497, 16, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (85, 36, 57, 354305, 38879, 2, 'in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (16, 47, 66, 489750, 55554, 2, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (6, 45, 60, 688644, 85823, 14, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (33, 31, 49, 984695, 17139, 18, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (37, 4, 91, 360901, 60774, 15, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (54, 34, 82, 46370, 18836, 4, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (85, 22, 24, 323927, 1449, 18, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (53, 24, 4, 666240, 3678, 20, 'arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (73, 11, 10, 760450, 9681, 12, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (63, 44, 90, 349795, 94513, 14, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (90, 46, 38, 922350, 45642, 6, 'in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum');
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (23, 28, 66, 468239, 77594, 9, null);
insert into CTHD (idHD, idCTSP, SoLuong, DonGia, GiamGia, ThanhTien, GhiChu) values (42, 41, 76, 312532, 10103, 14, null);




