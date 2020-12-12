-- rx-side fsm of an spw router
-- fsm:
-- 1. wait for 1 on input hadshake
-- 2. drive out handshake high
-- 3. sneak-peek first word of the pending pkg
-- 4. latch it into oPath
-- 5. if wormhole routing is used, discard first word of the kg
-- 6. drive oRequest_mux high
-- 7. wait for iGranted to go high (goto 8) or iDiscard (goto 13) go high, else error
-- 8. drive oRequest_mux low
-- 9. connect data iface of the sink to pkg buffer
-- 10. when EOP or EEP is transmitted, drive out handshake low
-- 11. wait for input handshake to go low
-- 12. go to 1
-- 13. discard package, goto 1
-- handle exceptions in all states


library ieee;
use ieee.std_logic_1164.all;


entity spw_router_rx_fsm is
    port (
        iClk: in std_logic;
        iReset: in std_logic;

        -- to pkg buffer
        iHandshake: in std_logic;
        oHandshake: out std_logic;

        -- to router control
        oRequest_mux: out std_logic;
        oPath: out std_logic_vector (7 downto 0);
        iGranted: in std_logic;
        iDiscard: in std_logic;

        -- to pkg buffer
        iValid: in std_logic;
        iData: in std_logic_vector (8 downto 0);
        oAck: out std_logic;

        -- to data sink
        oValid: out std_logic;
        oData: out std_logic_vector (8 downto 0);
        iAck: in std_logic
    );
end entity;

architecture v1 of spw_router_rx_fsm is
begin
end v1;