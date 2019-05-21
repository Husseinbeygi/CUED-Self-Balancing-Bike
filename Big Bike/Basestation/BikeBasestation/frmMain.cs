using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using System.IO.Ports;

namespace BikeBasestation
{
    public partial class frmMain : Form
    {

        SerialPort radio;

        bool connected;
        bool started;

        bool radioParsing = false;
        int parseCounter = 0;
        int sign = 1;
        int strSign = 1;

        const int NUM_ELEMENTS = 100;
        float[] leanAngle = new float[NUM_ELEMENTS];
        int[] steerAngle = new int[NUM_ELEMENTS];
        
        System.Diagnostics.Stopwatch stopwatch = new System.Diagnostics.Stopwatch();

        public frmMain()
        {
            InitializeComponent();
            this.FormClosing += frmMain_FormClosing;

            // Make serial port list non-editable
            cmbPorts.DropDownStyle = ComboBoxStyle.DropDownList;

            // Display list of available serial ports
            foreach (string port in SerialPort.GetPortNames())
            {
                cmbPorts.Items.Add(port);
            }

            cmbPorts.SelectedIndex = 0;

            connected = false;
            started = false;
        }

        private void frmMain_FormClosing(Object sender, FormClosingEventArgs e)
        {
            if (connected)
            {
                radio.Close();
            }
        }

        private void btnConnect_Click(object sender, EventArgs e)
        {
            if (connected)
            {

                if (started)
                {

                    addLog("Stop bicycle before disconnecting!");
                }
                else
                {
                    DialogResult res = MessageBox.Show("Confirm disconnect?", "Disconnect Radio", MessageBoxButtons.OKCancel);

                    if (res == DialogResult.OK)
                    {
                        radio.Close();
                        connected = false;

                        btnConnect.Text = "Connect";
                        btnResetEncoder.Enabled = false;
                        btnStartStop.Enabled = false;

                        addLog("Disconnected.");
                        
                    }
                }
                
            }
            else
            {
                addLog("Attempting connection to serial port " + cmbPorts.SelectedItem.ToString());

                try
                {

                    radio = new SerialPort(cmbPorts.SelectedItem.ToString(), 115200, Parity.None, 8, StopBits.One);
                    radio.DataReceived += new SerialDataReceivedEventHandler(port_DataReceived);
                    radio.Open();


                }
                catch (Exception ex)
                {

                    addLog("Error occured: " + ex.Message);
                    connected = false;
                    return;

                }
                
                btnConnect.Text = "Disconnect";
                btnResetEncoder.Enabled = true;
                btnStartStop.Enabled = true;

                connected = true;
                addLog("Connection successful.");
            }
        }

       

        private void port_DataReceived(object sender, SerialDataReceivedEventArgs e)
        {

            if (!radio.IsOpen) return;

            int bytes = radio.BytesToRead;
            byte[] buffer = new byte[bytes];
            radio.Read(buffer, 0, bytes);

            float rollSign = 1;
            int steerSign = 1;

            for (int i = 0; i < bytes; i++)
            {

                if (radioParsing)
                {

                    if (parseCounter == 0)
                    {
                        rollSign = (buffer[i] == 1) ? 1 : -1;
                    } else if (parseCounter == 1)
                    {
                        float leanAngleRx = rollSign * ((float) Convert.ToInt32(buffer[i])) / 10.0f;

                        /* Shift arrays */
                        for (int n = NUM_ELEMENTS - 1; n > 0; n--)
                        {
                            leanAngle[n] = leanAngle[n - 1];

                        }

                        leanAngle[0] = leanAngleRx;
                        this.lblLeanAngle.BeginInvoke((MethodInvoker)delegate () { this.lblLeanAngle.Text = leanAngleRx.ToString() + "°"; ; ; });
                    } else if (parseCounter == 2) {
                        steerSign = (buffer[i] == 1) ? 1 : -1;
                    } else if (parseCounter == 3) {
                        int steerAngleRx = steerSign * Convert.ToInt32(buffer[i]);
                        /* Shift arrays */
                        for (int n = NUM_ELEMENTS - 1; n > 0; n--)
                        {
                            steerAngle[n] = steerAngle[n - 1];

                        }

                        steerAngle[0] = steerAngleRx;

                        this.lblSteerAngle.BeginInvoke((MethodInvoker)delegate () { this.lblSteerAngle.Text = steerAngleRx.ToString() + "°"; ; ; });

                    }

                    parseCounter++;

                    if (buffer[i] == 255)
                    {
                        this.rawData.BeginInvoke((MethodInvoker)delegate () { rawData.Rows.Add(new object[] { stopwatch.Elapsed.Milliseconds, steerAngle[0], leanAngle[0] }); });
                        
                        parseCounter = 0;
                        radioParsing = false;
                    }
                                                                

                }
                else
                {
                    
                    if (buffer[i] >= 0 && buffer[i] <= 100)
                    {
                        addLog("Updated setting to: " + buffer[i].ToString());
                    } else if (buffer[i] == 250)
                    {
                        addLog("Zero-d yaw.");
                    }
                    else if (buffer[i] == 251)
                    {
                        addLog("Reset encoder position.");
                    }
                    else if (buffer[i] == 252)
                    {
                        addLog("Bike started.");
                    }
                    else if (buffer[i] == 253)
                    {
                        addLog("Bike stopped.");
                    }
                    else if (buffer[i] >= 101 && buffer[i] <= 103)
                    {
                        addLog("Countdown ---> [" + (Convert.ToInt16(buffer[i]) - 100) + "]");
                    }
                    else if (buffer[i] == 254)
                    {
                        radioParsing = true;
                        parseCounter = 0;
                    } else if (buffer[i] == 255)
                    {
                        radioParsing = false;
                        parseCounter = 0;
                    }

                }

            }
        }

        private void addLog(String txt)
        {
            if (InvokeRequired)
            {
                this.Invoke(new Action<string>(addLog), new object[] { txt });
                return;
            }
            txtLog.Text = ">>> " + txt + "\n" + txtLog.Text;
        }

        private void btnResetEncoder_Click(object sender, EventArgs e)
        {
            var dataArray = new byte[] { 251 };
            radio.Write(dataArray, 0, 1);
        }

        private void btnStartStop_Click(object sender, EventArgs e)
        {

            var dataArray = new byte[] { 252 };
            radio.Write(dataArray, 0, 1);

            if (started)
            {
                tmrChart.Enabled = false;
                addLog("Sent STOP command.");
                btnStartStop.Text = "Start";
                started = false;
                stopwatch.Stop();
            } else
            {
                tmrChart.Enabled = true;
                addLog("Sent START command.");
                btnStartStop.Text = "Stop";
                started = true;
                stopwatch.Reset();
                stopwatch.Start();
                
            }

            radioParsing = false;
            parseCounter = 0;

        }

        private decimal Map(decimal x, long in_min, long in_max, long out_min, long out_max)
        {
            return Convert.ToDecimal((x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min);
        }

        private void tmrChart_Tick(object sender, EventArgs e)
        {
            chrtLean.Series[0].Points.Clear();
            chrtSteer.Series[0].Points.Clear();

            for (int n = 0; n < NUM_ELEMENTS; n++)
            {
                chrtLean.Series[0].Points.AddXY(NUM_ELEMENTS - n, leanAngle[n]);

            }

            for (int n = 0; n < NUM_ELEMENTS; n++)
            {
                chrtSteer.Series[0].Points.AddXY(NUM_ELEMENTS - n, steerAngle[n]);

            }

        }

        private void btnSaveLog_Click(object sender, EventArgs e)
        {
            if (saveFileDialog.ShowDialog() != DialogResult.Cancel)
            {
                var sb = new StringBuilder();

                var headers = rawData.Columns.Cast<DataGridViewColumn>();
                sb.AppendLine(string.Join(",", headers.Select(column => "\"" + column.HeaderText + "\"").ToArray()));

                foreach (DataGridViewRow row in rawData.Rows)
                {
                    var cells = row.Cells.Cast<DataGridViewCell>();
                    sb.AppendLine(string.Join(",", cells.Select(cell => "\"" + cell.Value + "\"").ToArray()));
                }

                System.IO.File.WriteAllText(saveFileDialog.FileName, sb.ToString());
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            chrtLean.Series[0].Points.Clear();
            chrtSteer.Series[0].Points.Clear();

            for (int n = 0; n < NUM_ELEMENTS; n++)
            {
                leanAngle[n] = 0;
                steerAngle[n] = 0;
            }

            rawData.Rows.Clear();
        }

        private void btnUpdateSettings_Click(object sender, EventArgs e)
        {
            // Start byte - settingID - driveSetting - Stop byte
            byte[] speedCMD = new byte[] { 254, 1, Convert.ToByte(txtSpeed.Text), 255 };
            radio.Write(speedCMD, 0, 4);

            // Start byte - settingID - Kp - Stop byte
            byte[] kpCMD = new byte[] { 254, 2, Convert.ToByte(txtP.Text), 255 };
            radio.Write(kpCMD, 0, 4);

            // Start byte - settingID - Ki - Stop byte
            byte[] kiCMD = new byte[] { 254, 3, Convert.ToByte(txtI.Text), 255 };
            radio.Write(kiCMD, 0, 4);

            // Start byte - settingID - Kd - Stop byte
            byte[] kdCMD = new byte[] { 254, 4, Convert.ToByte(txtD.Text), 255 };
            radio.Write(kdCMD, 0, 4);

            // Start byte - settingID - Tf - Stop byte
            byte[] tfCMD = new byte[] { 254, 5, Convert.ToByte(txtTf.Text), 255 };
            radio.Write(tfCMD, 0, 4);

            byte[] limCMD = new byte[] { 254, 6, Convert.ToByte(txtLim.Text), 255 };
            radio.Write(limCMD, 0, 4);
        }
    }
}
