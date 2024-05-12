
typedef struct{
   int H_resol;
   int W_resol;
   shortreal refresh_rate;
   int RB_v11;
   int RB_v11_force;
   int RB_v12;
   int film_optimized;
   int interlaced;
} argv_struct;

typedef struct{
   int H_resol;
   int W_resol;
   int Interlaced_en;
   int Reduced_Blank_en;
   shortreal V_freq_Hz;
   shortreal V_real_freq_Hz;
   shortreal H_freq_KHz;
   shortreal Pixel_clk_MHz;
   int H_active;
   int H_active_plus_H_front_porch;
   int H_active_plus_H_back_porch;
   int H_total;
   int V_active;
   int V_active_plus_V_front_porch;
   int V_active_plus_V_front_porch_plus_V_sync;
   int V_total;
   int H_sync_polarity; // 1="+" 0="-"
   int V_sync_polarity; // 1="+" 0="-"
} result_struct;

import "DPI-C" function void DPI_cvt(input argv_struct a_s, output result_struct r_s);

module tb;

   initial begin
      argv_struct a_s;
      result_struct r_s;
      a_s = '{640,480,60,0,0,0,0,0};
      DPI_cvt(a_s,r_s);
      a_s = '{640,480,60,1,1,0,0,0};
      DPI_cvt(a_s,r_s);
      a_s = '{640,480,60,0,0,1,0,0};
      DPI_cvt(a_s,r_s);
      a_s = '{640,480,60,0,0,0,1,0};
      DPI_cvt(a_s,r_s);
      a_s = '{640,480,60,0,0,0,0,1};
      DPI_cvt(a_s,r_s);
      a_s = '{640,480,100,1,0,0,1,1};
      DPI_cvt(a_s,r_s);
      $display("a_s:%p",a_s);
      $display("r_s:%p",r_s);
   end

endmodule
