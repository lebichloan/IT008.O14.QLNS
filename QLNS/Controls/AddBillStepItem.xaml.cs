using MaterialDesignThemes.Wpf;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace QLNS.Controls
{
    /// <summary>
    /// Interaction logic for AddBillStepItem.xaml
    /// </summary>
    public partial class AddBillStepItem : UserControl
    {
        public AddBillStepItem()
        {
            InitializeComponent();
        }

        public string Step
        {
            get { return (string)GetValue(StepProperty); }
            set { SetValue(StepProperty, value); }
        }

        public static readonly DependencyProperty StepProperty =
            DependencyProperty.Register("Step", typeof(string), typeof(AddBillStepItem));

        public string Title
        {
            get { return (string)GetValue(TitleProperty); }
            set { SetValue(TitleProperty, value); }
        }

        public static readonly DependencyProperty TitleProperty =
            DependencyProperty.Register("Title", typeof(string), typeof(AddBillStepItem));

        public string Number
        {
            get { return (string)GetValue(NumberProperty); }
            set { SetValue(NumberProperty, value); }
        }

        public static readonly DependencyProperty NumberProperty =
            DependencyProperty.Register("Number", typeof(string), typeof(AddBillStepItem));

        public bool IsActive
        {
            get { return (bool)GetValue(IsActiveProperty); }
            set { SetValue(IsActiveProperty, value); }
        }

        public static readonly DependencyProperty IsActiveProperty =
            DependencyProperty.Register("IsActive", typeof(bool), typeof(AddBillStepItem));

        public bool IsUnable
        {
            get { return (bool)GetValue(IsUnableProperty); }
            set { SetValue(IsUnableProperty, value); }
        }

        public static readonly DependencyProperty IsUnableProperty =
            DependencyProperty.Register("IsUnable", typeof(bool), typeof(AddBillStepItem));

        public bool IsPre
        {
            get { return (bool)GetValue(IsPreProperty); }
            set { SetValue(IsPreProperty, value); }
        }

        public static readonly DependencyProperty IsPreProperty =
            DependencyProperty.Register("IsPre", typeof(bool), typeof(AddBillStepItem));

    }
}
