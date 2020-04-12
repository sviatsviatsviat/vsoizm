using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;
using System.IO;

namespace ImageConverter
{
    class Program
    {
        static void Main(string[] args)
        {
            string conv_res = @"E:\Master Degree\VSOIZM\output_file.txt";
            StreamReader rdr = new StreamReader(conv_res);
            Bitmap res = new Bitmap(251, 251);

            for(int i = 0; i < 251; i++)
            {
                for(int j = 0; j < 251; j++)
                {
                    string line = rdr.ReadLine();
                    int val = int.Parse(line);
                    res.SetPixel(j, i, Color.FromArgb(val, val, val));
                }
            }

            res.Save(@"E:\Master Degree\VSOIZM\conv_res.bmp");
                    

            /*string imagePath = @"E:\Master Degree\VSOIZM\image.png"; //args[0];
            string outputPath = @"E:\Master Degree\VSOIZM\image.hex";
            StreamWriter sw = new StreamWriter(outputPath);

            using (Bitmap img = new Bitmap(imagePath))
            {
                for (int i = 0; i < img.Height; i++)
                {
                    for (int j = 0; j < img.Width; j++)
                    {
                        Color pixel = img.GetPixel(j, i);
                        int grayScale = (int)((pixel.R * 0.3) + (pixel.G * 0.59) + (pixel.B * 0.11));
                        byte valToSave = (byte)grayScale;
                        sw.WriteLine(valToSave.ToString("X"));
                    }
                }
            }

            sw.Close();*/
        }
    }
}
