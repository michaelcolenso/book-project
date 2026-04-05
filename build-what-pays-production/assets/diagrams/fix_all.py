import sys
import os
import glob
from PIL import Image

def fix_bg(input_path, output_path):
    img = Image.open(input_path).convert('RGB')
    
    # White point: top left pixel
    wp = img.getpixel((0,0))
    if wp[0] == 255 and wp[1] == 255 and wp[2] == 255:
        # Already white
        return
        
    print(f"Converting {input_path} (WP: {wp})")
    
    # Calculate scale factors
    r_scale = 255.0 / wp[0] if wp[0] > 0 else 1.0
    g_scale = 255.0 / wp[1] if wp[1] > 0 else 1.0
    b_scale = 255.0 / wp[2] if wp[2] > 0 else 1.0
    
    # Apply to all pixels
    lut_r = [min(255, int(i * r_scale)) for i in range(256)]
    lut_g = [min(255, int(i * g_scale)) for i in range(256)]
    lut_b = [min(255, int(i * b_scale)) for i in range(256)]
    
    # Split, point transform, merge
    r, g, b = img.split()
    r = r.point(lut_r)
    g = g.point(lut_g)
    b = b.point(lut_b)
    
    out = Image.merge('RGB', (r, g, b))
    out.save(output_path)

if __name__ == '__main__':
    folder = sys.argv[1]
    for p in glob.glob(os.path.join(folder, "bwp-*.png")):
        fix_bg(p, p)
