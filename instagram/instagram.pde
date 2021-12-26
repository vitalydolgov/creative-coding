size(100, 100);

PGraphics grad, icon, white, image;

color col_1 = color(0x66, 0x00, 0xff);
color col_2 = color(0xff, 0x99, 0x33);
color col_3 = color(0xff, 0x50, 0x50);

grad = createGraphics(100, 100);
grad.beginDraw();
grad.noStroke();

for (int i = 0; i < 100; i++) {
  for (int j = 0; j < 100; j++) {
    color temp1 = lerpColor(col_1, col_2, (float) i / 100 * 0.3);
    color temp2 = lerpColor(col_2, col_3, (float) i / 100 * 1.2);
    grad.stroke(lerpColor(temp1, temp2, (float) j / 100));
    grad.point(i, j);
  }
}

grad.endDraw();

white = createGraphics(100, 100);
white.beginDraw();
white.background(255);
white.endDraw();

icon = createGraphics(100, 100);
icon.beginDraw();
icon.noStroke();
icon.background(0);
icon.fill(0, 0, 255);
icon.rect(5, 5, 90, 90, 30);
icon.endDraw();

image = createGraphics(100, 100);
image.beginDraw();
image.noStroke();
image.background(1);
image.fill(255);
image.rect(15, 15, 70, 70, 22);
image.fill(0);
image.rect(20, 20, 60, 60, 20);
image.fill(255);
image.ellipse(50, 50, 30, 30);
image.fill(0);
image.ellipse(50, 50, 20, 20);
image.fill(255);
image.ellipse(68, 32, 7, 7);
image.endDraw();

grad.mask(icon);
image(grad, 0, 0);
white.mask(image);
image(white, 0, 0);

saveFrame();
