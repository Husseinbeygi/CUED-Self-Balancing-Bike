﻿namespace BikeBasestation
{
    partial class frmMain
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataVisualization.Charting.ChartArea chartArea1 = new System.Windows.Forms.DataVisualization.Charting.ChartArea();
            System.Windows.Forms.DataVisualization.Charting.Series series1 = new System.Windows.Forms.DataVisualization.Charting.Series();
            System.Windows.Forms.DataVisualization.Charting.ChartArea chartArea2 = new System.Windows.Forms.DataVisualization.Charting.ChartArea();
            System.Windows.Forms.DataVisualization.Charting.Series series2 = new System.Windows.Forms.DataVisualization.Charting.Series();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmMain));
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btnSaveLog = new System.Windows.Forms.Button();
            this.label11 = new System.Windows.Forms.Label();
            this.rawData = new System.Windows.Forms.DataGridView();
            this.Column1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.chrtSteer = new System.Windows.Forms.DataVisualization.Charting.Chart();
            this.chrtLean = new System.Windows.Forms.DataVisualization.Charting.Chart();
            this.lblSteerAngle = new System.Windows.Forms.Label();
            this.lblLeanAngle = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.label10 = new System.Windows.Forms.Label();
            this.CtrlLim = new System.Windows.Forms.TrackBar();
            this.label9 = new System.Windows.Forms.Label();
            this.Tf = new System.Windows.Forms.TrackBar();
            this.label6 = new System.Windows.Forms.Label();
            this.Kd = new System.Windows.Forms.TrackBar();
            this.Ki = new System.Windows.Forms.TrackBar();
            this.label8 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.Kp = new System.Windows.Forms.TrackBar();
            this.speedSetting = new System.Windows.Forms.TrackBar();
            this.cmbPorts = new System.Windows.Forms.ComboBox();
            this.txtLog = new System.Windows.Forms.RichTextBox();
            this.btnConnect = new System.Windows.Forms.Button();
            this.btnStartStop = new System.Windows.Forms.Button();
            this.btnResetEncoder = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.saveFileDialog = new System.Windows.Forms.SaveFileDialog();
            this.tmrChart = new System.Windows.Forms.Timer(this.components);
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.rawData)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.chrtSteer)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.chrtLean)).BeginInit();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.CtrlLim)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Tf)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Kd)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Ki)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Kp)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.speedSetting)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btnSaveLog);
            this.groupBox1.Controls.Add(this.label11);
            this.groupBox1.Controls.Add(this.rawData);
            this.groupBox1.Controls.Add(this.chrtSteer);
            this.groupBox1.Controls.Add(this.chrtLean);
            this.groupBox1.Controls.Add(this.lblSteerAngle);
            this.groupBox1.Controls.Add(this.lblLeanAngle);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Font = new System.Drawing.Font("DejaVu Sans Condensed", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(308, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(481, 602);
            this.groupBox1.TabIndex = 1;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Real-Time Data";
            // 
            // btnSaveLog
            // 
            this.btnSaveLog.Font = new System.Drawing.Font("DejaVu Sans Condensed", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSaveLog.Location = new System.Drawing.Point(10, 573);
            this.btnSaveLog.Name = "btnSaveLog";
            this.btnSaveLog.Size = new System.Drawing.Size(461, 23);
            this.btnSaveLog.TabIndex = 23;
            this.btnSaveLog.Text = "Save Log to CSV";
            this.btnSaveLog.UseVisualStyleBackColor = true;
            this.btnSaveLog.Click += new System.EventHandler(this.btnSaveLog_Click);
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("DejaVu Sans Condensed", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label11.Location = new System.Drawing.Point(6, 397);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(87, 19);
            this.label11.TabIndex = 10;
            this.label11.Text = "Raw Data";
            // 
            // rawData
            // 
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("DejaVu Sans Condensed", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.rawData.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.rawData.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.rawData.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Column1,
            this.Column2,
            this.Column3});
            this.rawData.Location = new System.Drawing.Point(10, 419);
            this.rawData.Name = "rawData";
            dataGridViewCellStyle2.Font = new System.Drawing.Font("DejaVu Sans Condensed", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.Color.Black;
            this.rawData.RowsDefaultCellStyle = dataGridViewCellStyle2;
            this.rawData.Size = new System.Drawing.Size(461, 150);
            this.rawData.TabIndex = 9;
            // 
            // Column1
            // 
            this.Column1.HeaderText = "Time";
            this.Column1.Name = "Column1";
            this.Column1.ReadOnly = true;
            // 
            // Column2
            // 
            this.Column2.HeaderText = "Steer Angle";
            this.Column2.Name = "Column2";
            // 
            // Column3
            // 
            this.Column3.HeaderText = "Lean Angle";
            this.Column3.Name = "Column3";
            // 
            // chrtSteer
            // 
            chartArea1.AxisX.Title = "Time (s)";
            chartArea1.Name = "ChartArea1";
            this.chrtSteer.ChartAreas.Add(chartArea1);
            this.chrtSteer.Location = new System.Drawing.Point(10, 244);
            this.chrtSteer.Name = "chrtSteer";
            series1.BorderWidth = 3;
            series1.ChartArea = "ChartArea1";
            series1.ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Spline;
            series1.Color = System.Drawing.Color.Red;
            series1.Name = "SteerAngle";
            this.chrtSteer.Series.Add(series1);
            this.chrtSteer.Size = new System.Drawing.Size(461, 150);
            this.chrtSteer.TabIndex = 8;
            // 
            // chrtLean
            // 
            chartArea2.AxisX.Title = "Time (s)";
            chartArea2.Name = "ChartArea1";
            this.chrtLean.ChartAreas.Add(chartArea2);
            this.chrtLean.Location = new System.Drawing.Point(10, 69);
            this.chrtLean.Name = "chrtLean";
            series2.BorderWidth = 3;
            series2.ChartArea = "ChartArea1";
            series2.ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Spline;
            series2.Name = "LeanAngle";
            this.chrtLean.Series.Add(series2);
            this.chrtLean.Size = new System.Drawing.Size(461, 150);
            this.chrtLean.TabIndex = 7;
            // 
            // lblSteerAngle
            // 
            this.lblSteerAngle.AutoSize = true;
            this.lblSteerAngle.Font = new System.Drawing.Font("DejaVu Sans Condensed", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSteerAngle.Location = new System.Drawing.Point(445, 222);
            this.lblSteerAngle.Name = "lblSteerAngle";
            this.lblSteerAngle.Size = new System.Drawing.Size(26, 19);
            this.lblSteerAngle.TabIndex = 6;
            this.lblSteerAngle.Text = "0°";
            // 
            // lblLeanAngle
            // 
            this.lblLeanAngle.AutoSize = true;
            this.lblLeanAngle.Font = new System.Drawing.Font("DejaVu Sans Condensed", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblLeanAngle.Location = new System.Drawing.Point(441, 47);
            this.lblLeanAngle.Name = "lblLeanAngle";
            this.lblLeanAngle.Size = new System.Drawing.Size(26, 19);
            this.lblLeanAngle.TabIndex = 5;
            this.lblLeanAngle.Text = "0°";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("DejaVu Sans Condensed", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(6, 222);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(104, 19);
            this.label2.TabIndex = 3;
            this.label2.Text = "Steer Angle";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("DejaVu Sans Condensed", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(6, 47);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(99, 19);
            this.label1.TabIndex = 2;
            this.label1.Text = "Lean Angle";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.label10);
            this.groupBox2.Controls.Add(this.CtrlLim);
            this.groupBox2.Controls.Add(this.label9);
            this.groupBox2.Controls.Add(this.Tf);
            this.groupBox2.Controls.Add(this.label6);
            this.groupBox2.Controls.Add(this.Kd);
            this.groupBox2.Controls.Add(this.Ki);
            this.groupBox2.Controls.Add(this.label8);
            this.groupBox2.Controls.Add(this.label7);
            this.groupBox2.Controls.Add(this.label5);
            this.groupBox2.Controls.Add(this.Kp);
            this.groupBox2.Controls.Add(this.speedSetting);
            this.groupBox2.Controls.Add(this.cmbPorts);
            this.groupBox2.Controls.Add(this.txtLog);
            this.groupBox2.Controls.Add(this.btnConnect);
            this.groupBox2.Controls.Add(this.btnStartStop);
            this.groupBox2.Controls.Add(this.btnResetEncoder);
            this.groupBox2.Controls.Add(this.label3);
            this.groupBox2.Controls.Add(this.label4);
            this.groupBox2.Font = new System.Drawing.Font("DejaVu Sans Condensed", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox2.Location = new System.Drawing.Point(12, 12);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(290, 602);
            this.groupBox2.TabIndex = 2;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Control";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("DejaVu Sans Condensed", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(6, 507);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(44, 19);
            this.label10.TabIndex = 22;
            this.label10.Text = "Lim:";
            // 
            // CtrlLim
            // 
            this.CtrlLim.LargeChange = 10;
            this.CtrlLim.Location = new System.Drawing.Point(73, 507);
            this.CtrlLim.Maximum = 75;
            this.CtrlLim.Minimum = 10;
            this.CtrlLim.Name = "CtrlLim";
            this.CtrlLim.Size = new System.Drawing.Size(211, 45);
            this.CtrlLim.SmallChange = 5;
            this.CtrlLim.TabIndex = 21;
            this.CtrlLim.Value = 30;
            this.CtrlLim.Scroll += new System.EventHandler(this.CtrlLim_Scroll);
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("DejaVu Sans Condensed", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(6, 456);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(31, 19);
            this.label9.TabIndex = 20;
            this.label9.Text = "Tf:";
            // 
            // Tf
            // 
            this.Tf.Location = new System.Drawing.Point(73, 456);
            this.Tf.Maximum = 75;
            this.Tf.Minimum = 1;
            this.Tf.Name = "Tf";
            this.Tf.Size = new System.Drawing.Size(211, 45);
            this.Tf.TabIndex = 19;
            this.Tf.Value = 10;
            this.Tf.Scroll += new System.EventHandler(this.Tf_Scroll);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("DejaVu Sans Condensed", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(6, 354);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(20, 19);
            this.label6.TabIndex = 18;
            this.label6.Text = "I:";
            // 
            // Kd
            // 
            this.Kd.Location = new System.Drawing.Point(73, 405);
            this.Kd.Maximum = 20;
            this.Kd.Name = "Kd";
            this.Kd.Size = new System.Drawing.Size(211, 45);
            this.Kd.TabIndex = 17;
            this.Kd.Value = 10;
            this.Kd.Scroll += new System.EventHandler(this.Kd_Scroll_1);
            // 
            // Ki
            // 
            this.Ki.Location = new System.Drawing.Point(73, 354);
            this.Ki.Maximum = 20;
            this.Ki.Name = "Ki";
            this.Ki.Size = new System.Drawing.Size(211, 45);
            this.Ki.TabIndex = 16;
            this.Ki.Value = 10;
            this.Ki.Scroll += new System.EventHandler(this.Ki_Scroll);
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("DejaVu Sans Condensed", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(6, 405);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(27, 19);
            this.label8.TabIndex = 15;
            this.label8.Text = "D:";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("DejaVu Sans Condensed", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(6, 300);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(26, 19);
            this.label7.TabIndex = 13;
            this.label7.Text = "P:";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("DejaVu Sans Condensed", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(6, 252);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(65, 19);
            this.label5.TabIndex = 10;
            this.label5.Text = "Speed:";
            // 
            // Kp
            // 
            this.Kp.Location = new System.Drawing.Point(73, 303);
            this.Kp.Maximum = 40;
            this.Kp.Name = "Kp";
            this.Kp.Size = new System.Drawing.Size(211, 45);
            this.Kp.TabIndex = 12;
            this.Kp.Value = 10;
            this.Kp.Scroll += new System.EventHandler(this.Kp_Scroll);
            // 
            // speedSetting
            // 
            this.speedSetting.Location = new System.Drawing.Point(73, 252);
            this.speedSetting.Maximum = 15;
            this.speedSetting.Minimum = 10;
            this.speedSetting.Name = "speedSetting";
            this.speedSetting.Size = new System.Drawing.Size(211, 45);
            this.speedSetting.TabIndex = 11;
            this.speedSetting.Value = 10;
            this.speedSetting.Scroll += new System.EventHandler(this.desiredSpeed_Scroll);
            // 
            // cmbPorts
            // 
            this.cmbPorts.Font = new System.Drawing.Font("DejaVu Sans Condensed", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbPorts.FormattingEnabled = true;
            this.cmbPorts.Location = new System.Drawing.Point(153, 194);
            this.cmbPorts.Name = "cmbPorts";
            this.cmbPorts.Size = new System.Drawing.Size(131, 23);
            this.cmbPorts.Sorted = true;
            this.cmbPorts.TabIndex = 10;
            // 
            // txtLog
            // 
            this.txtLog.Font = new System.Drawing.Font("DejaVu Sans Condensed", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtLog.Location = new System.Drawing.Point(6, 69);
            this.txtLog.Name = "txtLog";
            this.txtLog.ReadOnly = true;
            this.txtLog.ScrollBars = System.Windows.Forms.RichTextBoxScrollBars.ForcedVertical;
            this.txtLog.Size = new System.Drawing.Size(278, 100);
            this.txtLog.TabIndex = 9;
            this.txtLog.Text = ">>> Bike basestation started.";
            // 
            // btnConnect
            // 
            this.btnConnect.Font = new System.Drawing.Font("DejaVu Sans Condensed", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnConnect.Location = new System.Drawing.Point(6, 194);
            this.btnConnect.Name = "btnConnect";
            this.btnConnect.Size = new System.Drawing.Size(141, 23);
            this.btnConnect.TabIndex = 6;
            this.btnConnect.Text = "&Connect";
            this.btnConnect.UseVisualStyleBackColor = true;
            this.btnConnect.Click += new System.EventHandler(this.btnConnect_Click);
            // 
            // btnStartStop
            // 
            this.btnStartStop.BackColor = System.Drawing.Color.Lime;
            this.btnStartStop.Enabled = false;
            this.btnStartStop.Font = new System.Drawing.Font("DejaVu Sans Condensed", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnStartStop.Location = new System.Drawing.Point(6, 560);
            this.btnStartStop.Name = "btnStartStop";
            this.btnStartStop.Size = new System.Drawing.Size(278, 36);
            this.btnStartStop.TabIndex = 5;
            this.btnStartStop.Text = "&Start";
            this.btnStartStop.UseVisualStyleBackColor = false;
            this.btnStartStop.Click += new System.EventHandler(this.btnStartStop_Click);
            // 
            // btnResetEncoder
            // 
            this.btnResetEncoder.Enabled = false;
            this.btnResetEncoder.Font = new System.Drawing.Font("DejaVu Sans Condensed", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnResetEncoder.Location = new System.Drawing.Point(6, 223);
            this.btnResetEncoder.Name = "btnResetEncoder";
            this.btnResetEncoder.Size = new System.Drawing.Size(278, 23);
            this.btnResetEncoder.TabIndex = 4;
            this.btnResetEncoder.Text = "&Reset Encoder";
            this.btnResetEncoder.UseVisualStyleBackColor = true;
            this.btnResetEncoder.Click += new System.EventHandler(this.btnResetEncoder_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("DejaVu Sans Condensed", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(6, 172);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(99, 19);
            this.label3.TabIndex = 3;
            this.label3.Text = "Commands";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("DejaVu Sans Condensed", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(6, 47);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(38, 19);
            this.label4.TabIndex = 2;
            this.label4.Text = "Log";
            // 
            // saveFileDialog
            // 
            this.saveFileDialog.Filter = "CSV File|*.csv";
            this.saveFileDialog.Title = "Save Data Log";
            // 
            // tmrChart
            // 
            this.tmrChart.Interval = 200;
            this.tmrChart.Tick += new System.EventHandler(this.tmrChart_Tick);
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(801, 625);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "frmMain";
            this.Text = "Bike Basestation";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.rawData)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.chrtSteer)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.chrtLean)).EndInit();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.CtrlLim)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Tf)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Kd)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Ki)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Kp)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.speedSetting)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label lblSteerAngle;
        private System.Windows.Forms.Label lblLeanAngle;
        private System.Windows.Forms.Button btnConnect;
        private System.Windows.Forms.Button btnStartStop;
        private System.Windows.Forms.Button btnResetEncoder;
        private System.Windows.Forms.RichTextBox txtLog;
        private System.Windows.Forms.ComboBox cmbPorts;
        private System.Windows.Forms.TrackBar speedSetting;
        private System.Windows.Forms.TrackBar Kp;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.DataVisualization.Charting.Chart chrtLean;
        private System.Windows.Forms.TrackBar Kd;
        private System.Windows.Forms.TrackBar Ki;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TrackBar Tf;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.DataVisualization.Charting.Chart chrtSteer;
        private System.Windows.Forms.SaveFileDialog saveFileDialog;
        private System.Windows.Forms.Timer tmrChart;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TrackBar CtrlLim;
        private System.Windows.Forms.Button btnSaveLog;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.DataGridView rawData;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column1;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column2;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column3;
    }
}

