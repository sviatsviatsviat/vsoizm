using System.Drawing;
using System.IO;

namespace ImageConverter
{
    class Program
    {
        static void Main(string[] args)
        {
            string cmd = args.Length > 0 ? args[0] : "restore";
            
            if(cmd == "restore")
            {
                string convRes = @"E:\Master Degree\VSOIZM\output_file.txt";
                string imagePath = @"E:\Master Degree\VSOIZM\conv_res.bmp";
                ConvertNumbersToImage(convRes, imagePath, 249);
            }

            if(cmd == "encode")
            {
                string imagePath = @"E:\Master Degree\VSOIZM\image.png";
                string outputPath = @"E:\Master Degree\VSOIZM\image.hex";

                ConvertImageToHex(imagePath, outputPath);
            }
        }

        static void ConvertNumbersToImage(string inputFilePath, string imagePath, int size)
        {
            StreamReader rdr = new StreamReader(inputFilePath);
            Bitmap res = new Bitmap(size, size);

            for (int i = 0; i < size; i++)
            {
                for (int j = 0; j < size; j++)
                {
                    string line = rdr.ReadLine();
                    int val = int.Parse(line);
                    res.SetPixel(j, i, Color.FromArgb(val, val, val));
                }
            }

            res.Save(imagePath);
        }

        static void ConvertImageToHex(string imagePath, string hexPath)
        {
            StreamWriter sw = new StreamWriter(hexPath);

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

            sw.Close();
        }
    }
}
