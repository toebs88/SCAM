-- SYNC AND NOTIFY SIGNALS (1-cycle macros) -- 
macro b_in_notify :  boolean  := end macro; 
macro b_in_sync   :  boolean  := end macro; 
macro b_out_notify :  boolean  := end macro; 
macro b_out_sync   :  boolean  := end macro; 


-- DP SIGNALS -- 
macro b_in_sig_mode : Mode := end macro; 
macro b_in_sig_x : int := end macro; 
macro b_in_sig_y : bool := end macro; 
macro b_out_sig_mode : Mode := end macro; 
macro b_out_sig_x : int := end macro; 
macro b_out_sig_y : bool := end macro; 


--CONSTRAINTS-- 
constraint no_reset := rst = '0'; end constraint; 


-- VISIBLE REGISTERS --
macro compoundType_mode : Mode := end macro; 
macro compoundType_x : int := end macro; 
macro compoundType_y : bool := end macro; 


-- STATES -- 
macro SECTION_A_0 : boolean := true end macro;
macro SECTION_A_1 : boolean := true end macro;


--Operations -- 
property reset is
assume:
	 reset_sequence;
prove:
	 at t: SECTION_A_0;
	 at t: compoundType_mode = READ;
	 at t: compoundType_x = resize(0,32);
	 at t: compoundType_y = false;
	 at t: b_in_notify = true;
	 at t: b_out_notify = false;
end property;


property SECTION_A_0_read_0 is
dependencies: no_reset;
for timepoints:
	 t_end = t+1;
freeze:
	b_in_sig_mode_at_t = b_in_sig_mode@t,
	b_in_sig_x_at_t = b_in_sig_x@t,
	b_in_sig_y_at_t = b_in_sig_y@t;
assume: 
	 at t: SECTION_A_0;
	 at t: b_in_sync;
prove:
	 at t_end: SECTION_A_1;
	 at t_end: b_out_sig_mode = b_in_sig_mode_at_t;
	 at t_end: b_out_sig_x = b_in_sig_x_at_t;
	 at t_end: b_out_sig_y = b_in_sig_y_at_t;
	 at t_end: compoundType_mode = b_in_sig_mode_at_t;
	 at t_end: compoundType_x = b_in_sig_x_at_t;
	 at t_end: compoundType_y = b_in_sig_y_at_t;
	 during[t+1, t_end]: b_in_notify = false;
	 during[t+1, t_end-1]: b_out_notify = false;
	 at t_end: b_out_notify = true;
end property;

property SECTION_A_1_write_1 is
dependencies: no_reset;
for timepoints:
	 t_end = t+1;
freeze:
	compoundType_mode_at_t = compoundType_mode@t,
	compoundType_x_at_t = compoundType_x@t,
	compoundType_y_at_t = compoundType_y@t;
assume: 
	 at t: SECTION_A_1;
	 at t: b_out_sync;
prove:
	 at t_end: SECTION_A_0;
	 at t_end: compoundType_mode = compoundType_mode_at_t;
	 at t_end: compoundType_x = compoundType_x_at_t;
	 at t_end: compoundType_y = compoundType_y_at_t;
	 during[t+1, t_end-1]: b_in_notify = false;
	 at t_end: b_in_notify = true;
	 during[t+1, t_end]: b_out_notify = false;
end property;

property wait_SECTION_A_0 is
dependencies: no_reset;
freeze:
	compoundType_mode_at_t = compoundType_mode@t,
	compoundType_x_at_t = compoundType_x@t,
	compoundType_y_at_t = compoundType_y@t;
assume: 
	 at t: SECTION_A_0;
	 at t: not(b_in_sync);
prove:
	 at t+1: SECTION_A_0;
	 at t+1: compoundType_mode = compoundType_mode_at_t;
	 at t+1: compoundType_x = compoundType_x_at_t;
	 at t+1: compoundType_y = compoundType_y_at_t;
	 at t+1: b_in_notify = true;
	 at t+1: b_out_notify = false;
end property;

property wait_SECTION_A_1 is
dependencies: no_reset;
freeze:
	compoundType_mode_at_t = compoundType_mode@t,
	compoundType_x_at_t = compoundType_x@t,
	compoundType_y_at_t = compoundType_y@t;
assume: 
	 at t: SECTION_A_1;
	 at t: not(b_out_sync);
prove:
	 at t+1: SECTION_A_1;
	 at t+1: b_out_sig_mode = compoundType_mode_at_t;
	 at t+1: b_out_sig_x = compoundType_x_at_t;
	 at t+1: b_out_sig_y = compoundType_y_at_t;
	 at t+1: compoundType_mode = compoundType_mode_at_t;
	 at t+1: compoundType_x = compoundType_x_at_t;
	 at t+1: compoundType_y = compoundType_y_at_t;
	 at t+1: b_in_notify = false;
	 at t+1: b_out_notify = true;
end property;