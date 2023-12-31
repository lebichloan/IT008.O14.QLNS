﻿using QLNS.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace QLNS.ResourceXAML
{
    /// <summary>
    /// Interaction logic for DetailUser.xaml
    /// </summary>
    public partial class DetailHomeUser : Window, INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public int idNV { get; set; }

        private string maNhanVien;
        public string MaNhanVien { get { return maNhanVien; } set { maNhanVien = value; OnPropertyChanged(); } }
        public DetailHomeUser()
        {
            InitializeComponent();
        }

        private void btnClose_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void detailHomeUser_Loaded(object sender, RoutedEventArgs e)
        {
            DataContext = this;
            NHANVIEN nhanvien = DataProvider.Ins.DB.NHANVIENs.Find(idNV);
            if (nhanvien != null)
            {
                MaNhanVien = nhanvien.MaNV;
            }
        }
    }
}
