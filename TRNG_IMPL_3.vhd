library IEEE;
use IEEE.std_logic_1164.all;

entity TRNG_IMPL_3 is 
port(
clk : in std_logic;
rst : in std_logic;
S0 : out std_logic);
end TRNG_IMPL_3;

architecture hardware of TRNG_IMPL_3 is 

signal A, B: std_logic_vector (15 downto 0) ;
signal C: std_logic_vector (7 downto 0) ;
signal D,E,F : std_logic_vector (3 downto 0);
signal G: std_logic_vector (1 downto 0);
signal X : std_logic := '0';
signal clk2 : std_logic := '0';



	
component O_Ring is
port(
sel : in std_logic;
A : in std_logic;
S : out std_logic);
end component;

component flipflop is
port(
clk : in std_logic;
rst : in std_logic;
A : in std_logic;
S : out std_logic);
end component;

component XOR_C is
port(
clk : in std_logic;
rst : in std_logic;
A : in std_logic;
B : in std_logic;
S : out std_logic);

end component;

BEGIN 

process(clk)
begin
if (clk'event and clk = '1') then
clk2 <= not(clk2);
end if;
end process; 

anel_1_1 : O_Ring port map (rst,'0', A(0));
anel_2_1 : O_Ring port map (rst,'0',A(1));
anel_3_1 : O_Ring port map (rst,'0', A(2));
anel_4_1 : O_Ring port map (rst,'0',A(3));
anel_5_1 : O_Ring port map (rst,'0', A(4));
anel_6_1 : O_Ring port map (rst,'0',A(5));
anel_7_1 : O_Ring port map (rst,'0',A(6));
anel_8_1 : O_Ring port map (rst,'0', A(7));
anel_9_1 : O_Ring port map (rst,'0', A(8));
anel_10_1 : O_Ring port map (rst,'0', A(9));
anel_11_1 : O_Ring port map (rst,'0', A(10));
anel_12_1 : O_Ring port map (rst,'0', A(11));
anel_13_1 : O_Ring port map (rst,'0', A(12));
anel_14_1 : O_Ring port map (rst,'0', A(13));
anel_15_1 : O_Ring port map (rst,'0', A(14));
anel_16_1 : O_Ring port map (rst,'0', A(15));

flip_1_1 : flipflop port map (clk,rst, A(0), B(0));
flip_2_1 : flipflop port map (clk,rst, A(1), B(1));
flip_3_1 : flipflop port map (clk,rst, A(2), B(2));
flip_4_1 : flipflop port map (clk,rst, A(3), B(3));
flip_5_1 : flipflop port map (clk,rst, A(4), B(4));
flip_6_1 : flipflop port map (clk,rst, A(5), B(5));
flip_7_1 : flipflop port map (clk,rst, A(6), B(6));
flip_8_1 : flipflop port map (clk,rst, A(7), B(7));
flip_9_1 : flipflop port map (clk,rst, A(8), B(8));
flip_10_1 : flipflop port map (clk,rst, A(9), B(9));
flip_11_1 : flipflop port map (clk,rst, A(10), B(10));
flip_12_1 : flipflop port map (clk,rst, A(11), B(11));
flip_13_1 : flipflop port map (clk,rst, A(12), B(12));
flip_14_1 : flipflop port map (clk,rst, A(13), B(13));
flip_15_1 : flipflop port map (clk,rst, A(14), B(14));
flip_16_1 : flipflop port map (clk,rst, A(15), B(15));

XOR_1_1 : XOR_C port map (clk, rst, B(0), B(1), C(0));
XOR_2_1 : XOR_C port map (clk, rst,B(2), B(3), C(1));
XOR_3_1 : XOR_C port map (clk, rst,B(4), B(5), C(2));
XOR_4_1 : XOR_C port map (clk, rst,B(6), B(7), C(3));
XOR_5_1 : XOR_C port map (clk, rst,B(8), B(9), C(4));
XOR_6_1 : XOR_C port map (clk, rst,B(10), B(11), C(5));
XOR_7_1 : XOR_C port map (clk, rst,B(12), B(13), C(6));
XOR_8_1 : XOR_C port map (clk, rst,B(14), B(15), C(7));

XOR_1_2 : XOR_C port map(clk , rst,C(0), C(1), D(0));
XOR_2_2 : XOR_C port map(clk , rst,C(2), C(3), D(1));
XOR_3_2 : XOR_C port map(clk , rst,C(4), C(5), D(2));
XOR_4_2 : XOR_C port map(clk , rst,C(6), C(7), D(3));


anel_1_2 : O_Ring port map(clk2 ,D(0), E(0));
anel_3_2 : O_Ring port map(clk2 ,D(1), E(1));
anel_4_2 : O_Ring port map(clk2 ,D(2), E(2));
anel_5_2 : O_Ring port map(clk2 ,D(3), E(3));

flip_1_2 : flipflop port map(clk,rst, E(0), F(0));
flip_2_2 : flipflop port map(clk,rst, E(1), F(1));
flip_3_2 : flipflop port map(clk,rst, E(2), F(2));
flip_4_2 : flipflop port map(clk,rst, E(3), F(3));


XOR_1_3 : XOR_C port map (clk,rst, F(0), F(1), G(0));
XOR_2_3 : XOR_C port map (clk,rst, F(2), F(3), G(1));
XOR_3_3 : XOR_C port map (clk,rst, G(0), G(1), X);

process(rst, clk)
begin
if(rst = '1') then
	S0 <= '0';
	elsif(clk'event and clk = '1') then
	S0 <= X;
	end if;
	end process;
end hardware;