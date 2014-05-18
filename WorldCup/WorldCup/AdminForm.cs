﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Reflection;
namespace WorldCup
{
    public partial class AdminForm : Form
    {
        private TableType currentTable = TableType.None;
        private Utilities utilitiesObject = new Utilities();

        public AdminForm()
        {
            InitializeComponent();
        }

        private void AdminForm_Load(object sender, EventArgs e)
        {
            lbUsername.Text = "Welcome " + Program.username;
        }

        private void tbTaiKhoan_Click(object sender, EventArgs e)
        {
            currentTable = TableType.TaiKhoan;
            utilitiesObject.viewTable("TAI_KHOAN", dgv);
        }

        private void btWorldCup_Click(object sender, EventArgs e)
        {
            currentTable = TableType.TaiKhoan;
            utilitiesObject.viewTable("CAU_THU", dgv);
        }

        private void btQuanLyDoiBong_Click(object sender, EventArgs e)
        {
            currentTable = TableType.QuanLyDoiBong;
            utilitiesObject.viewTable("QUAN_LY_DOI_BONG", dgv);
        }

        private void dgv_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {

        }

        
    }
}
