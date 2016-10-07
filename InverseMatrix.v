`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//Name : Bhatt Kartavya M.
//Roll : 201501009
//Program : To calculate inverse of 5*5 matrix
//			
//////////////////////////////////////////////////////////////////////////////////
module InverseA(ram1,start,clk,write);

input start,clk;
output [31:0]ram1;


wire [5:0]addrRamin;
reg [5:0]addrRam;
reg [31:0]RamOut,Ramin;
reg [31:0]temp;
wire flag;
wire swapcount,swapflag;
reg [1:0] nextstage;
integer A[0:4][0:9];
integer row = 0,col = 0;
integer const;
reg writeflag;
reg delay ;


reg rowtemp,coltemp;
reg rowadditionflag;
reg iflag;

initial
begin
	nextstage = 2'b00;
	addrRam = 0;
	rowtemp = 0;
	rowadditionflag = 0;
	iflag = 1;
	writeflag = 0;
	delay = 0;
end



DataRam ram (
  .clka(clk), 
  .wea(writeflag), 
  .addra(addrRam), 
  .dina(Ramin), 
  .douta(ram1) 
);




always@(posedge clk)
begin
	if(nextstage == 2'b00)
	if(delay == 0)
	begin
		delay = 1;
		addrRam = addrRam + 1'b1;
	end
	else
	begin
	temp = ram1;
	A[row][col] =  ram1;
	

		if(col < 10)
		begin
			if(col == 9)
			begin
				row = row + 1'b1;
				col = 0;
			end
			else
				col = col + 1;
		end
		if( row == 4)
		begin
			if(col == 9)
			begin
				nextstage = 2'b01;
			end
		end
		addrRam = addrRam + 1'b1;
	end
	else if(nextstage == 2'b01)
	begin
		
		if(A[0][0] != 32'b0)
		begin
			const = A[1][0] / A[0][0];
			write = const;
			
			A[1][0] = A[1][0] - ((const)*A[0][0]);
			A[1][1] = A[1][1] - ((const)*A[0][1]);
			A[1][2] = A[1][2] - ((const)*A[0][2]);
			A[1][3] = A[1][3] - ((const)*A[0][3]);
			A[1][4] = A[1][4] - ((const)*A[0][4]);
			A[1][5] = A[1][5] - ((const)*A[0][5]);
			A[1][6] = A[1][6] - ((const)*A[0][6]);
			A[1][7] = A[1][7] - ((const)*A[0][7]);
			A[1][8] = A[1][8] - ((const)*A[0][8]);
			A[1][9] = A[1][9] - ((const)*A[0][9]);
		end
		if(A[0][0] != 0)
		begin
			const = A[2][0] / A[0][0];
			write = const;
			A[1][0] = A[1][0] - ((const)*A[0][0]);
			A[1][1] = A[1][1] - ((const)*A[0][1]);
			A[1][2] = A[1][2] - ((const)*A[0][2]);
			A[1][3] = A[1][3] - ((const)*A[0][3]);
			A[1][4] = A[1][4] - ((const)*A[0][4]);
			A[1][5] = A[1][5] - ((const)*A[0][5]);
			A[1][6] = A[1][6] - ((const)*A[0][6]);
			A[1][7] = A[1][7] - ((const)*A[0][7]);
			A[1][8] = A[1][8] - ((const)*A[0][8]);
			A[1][9] = A[1][9] - ((const)*A[0][9]);
		end
		if(A[0][0] != 0)
		begin
		
			const = A[3][0] / A[0][0];
			A[1][0] = A[1][0] - ((const)*A[0][0]);
			A[1][1] = A[1][1] - ((const)*A[0][1]);
			A[1][2] = A[1][2] - ((const)*A[0][2]);
			A[1][3] = A[1][3] - ((const)*A[0][3]);
			A[1][4] = A[1][4] - ((const)*A[0][4]);
			A[1][5] = A[1][5] - ((const)*A[0][5]);
			A[1][6] = A[1][6] - ((const)*A[0][6]);
			A[1][7] = A[1][7] - ((const)*A[0][7]);
			A[1][8] = A[1][8] - ((const)*A[0][8]);
			A[1][9] = A[1][9] - ((const)*A[0][9]);
		end
		if(A[0][0] != 0)
		begin
		
   		const = A[4][0] / A[0][0];
			write = const;
			A[1][0] = A[1][0] - ((const)*A[0][0]);
			A[1][1] = A[1][1] - ((const)*A[0][1]);
			A[1][2] = A[1][2] - ((const)*A[0][2]);
			A[1][3] = A[1][3] - ((const)*A[0][3]);
			A[1][4] = A[1][4] - ((const)*A[0][4]);
			A[1][5] = A[1][5] - ((const)*A[0][5]);
			A[1][6] = A[1][6] - ((const)*A[0][6]);
			A[1][7] = A[1][7] - ((const)*A[0][7]);
			A[1][8] = A[1][8] - ((const)*A[0][8]);
			A[1][9] = A[1][9] - ((const)*A[0][9]);
		end
		if(A[1][1] != 0)
		begin
		
			const = A[2][1] / A[1][1];
			write = const;
			A[2][0] = A[2][0] - ((const)*A[1][0]);
			A[2][1] = A[2][1] - ((const)*A[1][1]);
			A[2][2] = A[2][2] - ((const)*A[1][2]);
			A[2][3] = A[2][3] - ((const)*A[1][3]);
			A[2][4] = A[2][4] - ((const)*A[1][4]);
			A[2][5] = A[2][5] - ((const)*A[1][5]);
			A[2][6] = A[2][6] - ((const)*A[1][6]);
			A[2][7] = A[2][7] - ((const)*A[1][7]);
			A[2][8] = A[2][8] - ((const)*A[1][8]);
			A[2][9] = A[2][9] - ((const)*A[1][9]);
		end
		if(A[1][1] != 0)
		begin
			const = A[3][1] / A[1][1];
			write = const;
			A[2][0] = A[2][0] - ((const)*A[1][0]);
			A[2][1] = A[2][1] - ((const)*A[1][1]);
			A[2][2] = A[2][2] - ((const)*A[1][2]);
			A[2][3] = A[2][3] - ((const)*A[1][3]);
			A[2][4] = A[2][4] - ((const)*A[1][4]);
			A[2][5] = A[2][5] - ((const)*A[1][5]);
			A[2][6] = A[2][6] - ((const)*A[1][6]);
			A[2][7] = A[2][7] - ((const)*A[1][7]);
			A[2][8] = A[2][8] - ((const)*A[1][8]);
			A[2][9] = A[2][9] - ((const)*A[1][9]);
		end
		if(A[1][1] != 0)
		begin
			const = A[4][1] / A[1][1];
			write = const;
			A[2][0] = A[2][0] - ((const)*A[1][0]);
			A[2][1] = A[2][1] - ((const)*A[1][1]);
			A[2][2] = A[2][2] - ((const)*A[1][2]);
			A[2][3] = A[2][3] - ((const)*A[1][3]);
			A[2][4] = A[2][4] - ((const)*A[1][4]);
			A[2][5] = A[2][5] - ((const)*A[1][5]);
			A[2][6] = A[2][6] - ((const)*A[1][6]);
			A[2][7] = A[2][7] - ((const)*A[1][7]);
			A[2][8] = A[2][8] - ((const)*A[1][8]);
			A[2][9] = A[2][9] - ((const)*A[1][9]);
		end
		if(A[2][2] != 0)
		begin
			const = A[3][2] / A[2][2];
			write = const;
			A[3][0] = A[3][0] - ((const)*A[2][0]);
			A[3][1] = A[3][1] - ((const)*A[2][1]);
			A[3][2] = A[3][2] - ((const)*A[2][2]);
			A[3][3] = A[3][3] - ((const)*A[2][3]);
			A[3][4] = A[3][4] - ((const)*A[2][4]);
			A[3][5] = A[3][5] - ((const)*A[2][5]);
			A[3][6] = A[3][6] - ((const)*A[2][6]);
			A[3][7] = A[3][7] - ((const)*A[2][7]);
			A[3][8] = A[3][8] - ((const)*A[2][8]);
			A[3][9] = A[3][9] - ((const)*A[2][9]);
		end
		if(A[2][2] != 0)
		begin
			const = A[4][2] / A[2][2];
			write = const;
			A[3][0] = A[3][0] - ((const)*A[2][0]);
			A[3][1] = A[3][1] - ((const)*A[2][1]);
			A[3][2] = A[3][2] - ((const)*A[2][2]);
			A[3][3] = A[3][3] - ((const)*A[2][3]);
			A[3][4] = A[3][4] - ((const)*A[2][4]);
			A[3][5] = A[3][5] - ((const)*A[2][5]);
			A[3][6] = A[3][6] - ((const)*A[2][6]);
			A[3][7] = A[3][7] - ((const)*A[2][7]);
			A[3][8] = A[3][8] - ((const)*A[2][8]);
			A[3][9] = A[3][9] - ((const)*A[2][9]);
		end
		if(A[3][3] != 0)
		begin
			const = A[4][3] / A[3][3];
			write = const;
			A[4][0] = A[4][0] - ((const)*A[3][0]);
			A[4][1] = A[4][1] - ((const)*A[3][1]);
			A[4][2] = A[4][2] - ((const)*A[3][2]);
			A[4][3] = A[4][3] - ((const)*A[3][3]);
			A[4][4] = A[4][4] - ((const)*A[3][4]);
			A[4][5] = A[4][5] - ((const)*A[3][5]);
			A[4][6] = A[4][6] - ((const)*A[3][6]);
			A[4][7] = A[4][7] - ((const)*A[3][7]);
			A[4][8] = A[4][8] - ((const)*A[3][8]);
			A[4][9] = A[4][9] - ((const)*A[3][9]);
		end
		nextstage = 2'b10;
		addrRam = 0;
		row = 3;
		col = 3;
	end
	else if(nextstage == 2'b10 )
	begin
	if(A[4][4] != 0)
		begin
			const = A[3][4] / A[4][4];
			write = const;
			A[3][0] = A[3][0] - ((const)*A[4][0]);
			A[3][1] = A[3][1] - ((const)*A[4][1]);
			A[3][2] = A[3][2] - ((const)*A[4][2]);
			A[3][3] = A[3][3] - ((const)*A[4][3]);
			A[3][4] = A[3][4] - ((const)*A[4][4]);
			A[3][5] = A[3][5] - ((const)*A[4][5]);
			A[3][6] = A[3][6] - ((const)*A[4][6]);
			A[3][7] = A[3][7] - ((const)*A[4][7]);
			A[3][8] = A[3][8] - ((const)*A[4][8]);
		end
		if(A[4][4] != 0)
		begin
			const = A[2][4] / A[4][4];
			write = const;
			A[2][0] = A[2][0] - ((const)*A[4][0]);
			A[2][1] = A[2][1] - ((const)*A[4][1]);
			A[2][2] = A[2][2] - ((const)*A[4][2]);
			A[2][3] = A[2][3] - ((const)*A[4][3]);
			A[2][4] = A[2][4] - ((const)*A[4][4]);
			A[2][5] = A[2][5] - ((const)*A[4][5]);
			A[2][6] = A[2][6] - ((const)*A[4][6]);
			A[2][7] = A[2][7] - ((const)*A[4][7]);
			A[2][8] = A[2][8] - ((const)*A[4][8]);
		end
		if(A[4][4] != 0)
		begin
			const = A[1][4] / A[4][4];
			write = const;
			A[1][0] = A[1][0] - ((const)*A[4][0]);
			A[1][1] = A[1][1] - ((const)*A[4][1]);
			A[1][2] = A[1][2] - ((const)*A[4][2]);
			A[1][3] = A[1][3] - ((const)*A[4][3]);
			A[1][4] = A[1][4] - ((const)*A[4][4]);
			A[1][5] = A[1][5] - ((const)*A[4][5]);
			A[1][6] = A[1][6] - ((const)*A[4][6]);
			A[1][7] = A[1][7] - ((const)*A[4][7]);
			A[1][8] = A[1][8] - ((const)*A[4][8]);
		end
		if(A[4][4] != 0)
		begin
			const = A[0][4] / A[4][4];
			write = const;
			A[0][0] = A[0][0] - ((const)*A[4][0]);
			A[0][1] = A[0][1] - ((const)*A[4][1]);
			A[0][2] = A[0][2] - ((const)*A[4][2]);
			A[0][3] = A[0][3] - ((const)*A[4][3]);
			A[0][4] = A[0][4] - ((const)*A[4][4]);
			A[0][5] = A[0][5] - ((const)*A[4][5]);
			A[0][6] = A[0][6] - ((const)*A[4][6]);
			A[0][7] = A[0][7] - ((const)*A[4][7]);
			A[0][8] = A[0][8] - ((const)*A[4][8]);
		end
		if(A[3][3] != 0)
		begin
			const = A[2][3] / A[3][3];
			write = const;
			A[2][0] = A[2][0] - ((const)*A[3][0]);
			A[2][1] = A[2][1] - ((const)*A[3][1]);
			A[2][2] = A[2][2] - ((const)*A[3][2]);
			A[2][3] = A[2][3] - ((const)*A[3][3]);
			A[2][4] = A[2][4] - ((const)*A[3][4]);
			A[2][5] = A[2][5] - ((const)*A[3][5]);
			A[2][6] = A[2][6] - ((const)*A[3][6]);
			A[2][7] = A[2][7] - ((const)*A[3][7]);
			A[2][8] = A[2][8] - ((const)*A[3][8]);
		end
		if(A[3][3] != 0)
		begin
			const = A[1][3] / A[3][3];
			write = const;
			A[1][0] = A[1][0] - ((const)*A[3][0]);
			A[1][1] = A[1][1] - ((const)*A[3][1]);
			A[1][2] = A[1][2] - ((const)*A[3][2]);
			A[1][3] = A[1][3] - ((const)*A[3][3]);
			A[1][4] = A[1][4] - ((const)*A[3][4]);
			A[1][5] = A[1][5] - ((const)*A[3][5]);
			A[1][6] = A[1][6] - ((const)*A[3][6]);
			A[1][7] = A[1][7] - ((const)*A[3][7]);
			A[1][8] = A[1][8] - ((const)*A[3][8]);
		end
		if(A[3][3] != 0)
		begin
			const = A[0][3] / A[3][3];
			write = const;
			A[0][0] = A[0][0] - ((const)*A[3][0]);
			A[0][1] = A[0][1] - ((const)*A[3][1]);
			A[0][2] = A[0][2] - ((const)*A[3][2]);
			A[0][3] = A[0][3] - ((const)*A[3][3]);
			A[0][4] = A[0][4] - ((const)*A[3][4]);
			A[0][5] = A[0][5] - ((const)*A[3][5]);
			A[0][6] = A[0][6] - ((const)*A[3][6]);
			A[0][7] = A[0][7] - ((const)*A[3][7]);
			A[0][8] = A[0][8] - ((const)*A[3][8]);
		end
		if(A[2][2] != 0)
		begin
			const = A[1][2] / A[2][2];
			write = const;
			A[1][0] = A[1][0] - ((const)*A[2][0]);
			A[1][1] = A[1][1] - ((const)*A[2][1]);
			A[1][2] = A[1][2] - ((const)*A[2][2]);
			A[1][3] = A[1][3] - ((const)*A[2][3]);
			A[1][4] = A[1][4] - ((const)*A[2][4]);
			A[1][5] = A[1][5] - ((const)*A[2][5]);
			A[1][6] = A[1][6] - ((const)*A[2][6]);
			A[1][7] = A[1][7] - ((const)*A[2][7]);
			A[1][8] = A[1][8] - ((const)*A[2][8]);
		end
		if(A[2][2] != 0)
		begin
			const = A[0][2] / A[2][2];
			write = const;
			A[0][0] = A[0][0] - ((const)*A[2][0]);
			A[0][1] = A[0][1] - ((const)*A[2][1]);
			A[0][2] = A[0][2] - ((const)*A[2][2]);
			A[0][3] = A[0][3] - ((const)*A[2][3]);
			A[0][4] = A[0][4] - ((const)*A[2][4]);
			A[0][5] = A[0][5] - ((const)*A[2][5]);
			A[0][6] = A[0][6] - ((const)*A[2][6]);
			A[0][7] = A[0][7] - ((const)*A[2][7]);
			A[0][8] = A[0][8] - ((const)*A[2][8]);
		end
		if(A[1][1] != 0)
		begin
			const = A[0][1] / A[1][1];
			A[0][0] = A[0][0] - ((const)*A[1][0]);
			A[0][1] = A[0][1] - ((const)*A[1][1]);
			A[0][2] = A[0][2] - ((const)*A[1][2]);
			A[0][3] = A[0][3] - ((const)*A[1][3]);
			A[0][4] = A[0][4] - ((const)*A[1][4]);
			A[0][5] = A[0][5] - ((const)*A[1][5]);
			A[0][6] = A[0][6] - ((const)*A[1][6]);
			A[0][7] = A[0][7] - ((const)*A[1][7]);
			A[0][8] = A[0][8] - ((const)*A[1][8]);
		end
		addrRam = 0;
		writeflag = 1'b1;
		row = 0;
		col = 0;
		nextstage = 2'b11;
		Ramin =  A[row][col];
		row <= row + 1;
		col <= col + 1;
	end
	else if(nextstage == 2'b11 )
	begin
		Ramin =  A[row][col];
		
		write = row;
		if(col < 10)
			begin
				if(col == 9)
				begin
					row = row + 1'b1;
					col = 0;
				end
				else
					col = col + 1;
			end
			if( row == 5)
			begin
				if(col == 0)
				begin
					$finish;
				end
			end
		addrRam = addrRam + 1;
	end
end
endmodule
