module Arbiter #(  //仲裁器
    n = 4,
    type T = MSHRST::LineBufferReadReqST
) (
    output logic                 io_in_ready [n],  //里面消费者准备好接收第几个数据
    input  logic                 io_in_valid [n],  //外面生产者准备好第几个数据
    input  T                     io_in       [n],  //生产者猪呢比的输入数据
    input  logic                 io_out_ready,  //数据已经被外面消费者接收
    output logic                 io_out_valid,  //数据已经被生产者准备好
    output T                     io_out,  //输出数据
    output       [$clog2(n)-1:0] io_chosen  //选择第几个生产者的数据
);

  logic grant[n];
  always_comb begin
    io_out = io_in[n-1];
    for (int i = n-2; i >=0; i = i-1) begin
      if (io_in_valid[i]) begin
        io_chosen = i;
        io_out = io_in_valid[i];  //最低位优先级最高
        break;
      end
    end

    grant[0] = 1;  //生产者的第一个数据永远准备接收

    //仲裁器控制器, 只要in_valid中出现1, 接下来grant将全为0
    //为1的表示消费者可以接收的数据, 低位全为1高位全为0表示低位的优先级高
    for (int i = 1; i < n; i++) grant[i] = (grant[i - 1] & ~io_in_valid[i - 1]);  
    for (int i = 0; i < n; i++) io_in_ready[i] = grant[i] & io_out_ready;  //out的数据已经被接收方顺利接收

    //~grant[n-1]为0表示in_valid最后一位之前有1
    //这句话相当于|io_in_valid;
    io_out_valid = ~grant[n - 1] || io_in_valid[n - 1];
  end

endmodule

