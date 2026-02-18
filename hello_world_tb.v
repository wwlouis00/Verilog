`timescale 1ns/1ns  // 設定時間單位

module hello_world_tb;
    // 準備訊號
    reg a_in;
    reg b_in;
    wire y_out;

    // 把我們的設計拉進來 (實例化)
    hello_world uut (
        .a(a_in),
        .b(b_in),
        .y(y_out)
    );

    // 設計測試流程
    initial begin
        a_in = 0; b_in = 0; #10; // 等待 10ns
        a_in = 0; b_in = 1; #10;
        a_in = 1; b_in = 0; #10;
        a_in = 1; b_in = 1; #10;
        $finish;           // 結束模擬
    end

    // 產生波形檔
    initial begin
        $dumpfile("hello_world.vcd");
        $dumpvars(0, hello_world_tb);
    end

endmodule

