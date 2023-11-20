using QLNS.Model;
using QLNS.ResourceXAML;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace QLNS.ViewModel
{
    public class AddBillViewModel : BaseViewModel
    {
        private QLNSEntities qLNSEntities;
        private string searchterm;
        private int isSearch;

        public ObservableCollection<TabItemViewModel> Categories { get; set; }

        public ICommand SearchCommand { get; private set; }

        // ViewModel for each tab
        public class TabItemViewModel
        {
            public string Header { get; set; }
            public List<ProductViewModel> Products { get; set; }
        }

        // ViewModel for each product
        public class ProductViewModel
        {
            public string MaSP { get; set; }
            public string TenSP { get; set; }
            public int SLCL { get; set; }
            public decimal DonGia { get; set; }
            public string GhiChu { get; set; }
        }

        public AddBillViewModel()
        {
            qLNSEntities = new QLNSEntities();
            Categories = new ObservableCollection<TabItemViewModel>();
            LoadAllProduct();
            LoadDataIntoTab();

            SearchCommand = new RelayCommand<string>(FilterData);
        }

        private void LoadDataIntoTab()
        {
            var categories = from danhmuc in qLNSEntities.DANHMUCs
                             orderby danhmuc.idDM
                             select new TabItemViewModel
                             {
                                 Header = danhmuc.TenDM,
                                 Products = (List<ProductViewModel>)(from sanpham in qLNSEntities.SANPHAMs
                                            join ctsp in qLNSEntities.CTSPs on sanpham.idSP equals ctsp.idSP
                                            where sanpham.idDM == danhmuc.idDM
                                            orderby ctsp.idCTSP
                                            select new ProductViewModel
                                            {
                                                MaSP = ctsp.MaCTSP,
                                                TenSP = sanpham.TenSP,
                                                SLCL = ctsp.SLConLai,
                                                DonGia = ctsp.DonGiaXuat,
                                                GhiChu = ctsp.GhiChu,
                                            })
                             };

            foreach (var category in categories)
            {
                Categories.Add(category);
            }
        }

        private void LoadAllProduct()
        {
            var allProducts = from sanpham in qLNSEntities.SANPHAMs
                              join ctsp in qLNSEntities.CTSPs on sanpham.idSP equals ctsp.idSP
                              orderby ctsp.idCTSP
                              where ctsp.SLConLai > 0
                              select new ProductViewModel
                              {
                                  MaSP = ctsp.MaCTSP,
                                  TenSP = sanpham.TenSP,
                                  SLCL = ctsp.SLConLai,
                                  DonGia = ctsp.DonGiaXuat,
                                  GhiChu = ctsp.GhiChu,
                              };

            Categories.Add(new TabItemViewModel
            {
                Header = "Tất cả sản phẩm",
                Products = allProducts.ToList(),
            });
        }

        private void FilterData(string searchTerm)
        {
            var filteredProducts = from sanpham in qLNSEntities.SANPHAMs
                                   join ctsp in qLNSEntities.CTSPs on sanpham.idSP equals ctsp.idSP
                                   orderby ctsp.idCTSP
                                   where ctsp.SLConLai > 0 &&
                                         (ctsp.MaCTSP.ToLower().Contains(searchTerm) ||
                                          sanpham.TenSP.ToLower().Contains(searchTerm) ||
                                          ctsp.GhiChu.ToLower().Contains(searchTerm))
                                   select new ProductViewModel
                                   {
                                       MaSP = ctsp.MaCTSP,
                                       TenSP = sanpham.TenSP,
                                       SLCL = ctsp.SLConLai,
                                       DonGia = ctsp.DonGiaXuat,
                                       GhiChu = ctsp.GhiChu,
                                   };

            var firstTab = Categories.FirstOrDefault();
            if (firstTab != null)
            {
                firstTab.Header = string.IsNullOrEmpty(searchTerm) ? "Tất cả sản phẩm" : "Kết quả tìm kiếm";
                firstTab.Products = filteredProducts.ToList();
            }
        }
    }

}
