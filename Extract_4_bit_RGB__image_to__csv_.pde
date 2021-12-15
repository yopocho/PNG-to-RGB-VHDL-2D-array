PImage myImage;
PrintWriter output;
int arrSize = 0;

void setup()
{
  colorMode(RGB, 15);
  output = createWriter("4-bit RGB colour array for VGA.txt"); //Output file with 2D VHDL array
  myImage = loadImage("image.png"); //Input image (Rename and add appropriate image extention(.jpeg, .png))
  arrSize = myImage.width*myImage.height;
  loadPixels();
  size(100,100);
  surface.setResizable(true);
  surface.setSize(myImage.width,myImage.height);
  noLoop();
}

void draw()
{
  image(myImage,0,0);
  output.println("--Array is " + arrSize + " members long.");
  output.println("type ImArray is array (0 to " + (arrSize - 1) + ", 0 to 2) of integer range 0 to 15;\n");
  output.println("constant ArrayConstant : ImArray := (");
  for(int y = 0; y < myImage.height; y++)
  {
    for(int x = 0; x < myImage.width; x++)
    {
      color c = get(x,y);
      if(x == 0 && y == 0);
      else output.print(",");
      output.print("(" + round(red(c)) + ", " + round(green(c)) + ", " + round(blue(c)) + ")");
    }
    output.print("\n");
  }
  output.println(");\n");
  output.println("constant imWidth : integer range 0 to " + myImage.width + " := " + myImage.width + ";");
  output.println("constant imHeight : integer range 0 to " + myImage.height + " := " + myImage.height + ";");
  output.flush();
  output.close();
  exit();
}
