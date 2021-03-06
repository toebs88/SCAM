property reset is
assume:
	 reset_sequence;
prove:
	 at t: fetch_16(true);
	 at t: memoryAccess_addrIn(true) = resize(0,32);
	 at t: memoryAccess_dataIn(true) = resize(0,32);
	 at t: memoryAccess_mask(true) = MT_W;
	 at t: memoryAccess_req(true) = ME_RD;
	 at t: pcReg(true) = resize(0,32);
	 at t: regfileWrite_dst(true) = resize(0,32);
	 at t: regfileWrite_dstData(true) = resize(0,32);
	 at t: toMemoryPort_sig_addrIn = resize(0,32);
	 at t: toMemoryPort_sig_dataIn = resize(0,32);
	 at t: toMemoryPort_sig_mask = MT_W;
	 at t: toMemoryPort_sig_req = ME_RD;
	 at t: fromMemoryPort_notify = false;
	 at t: toMemoryPort_notify = true;
	 at t: toRegsPort_notify = false;
right_hook: t;
end property;


property execute_4_write_0 is
dependencies: no_reset,no_wait;
for timepoints:
	 t_end = t+1;
freeze:
	memoryAccess_addrIn_at_t = memoryAccess_addrIn(false)@t,
	memoryAccess_dataIn_at_t = memoryAccess_dataIn(false)@t,
	memoryAccess_mask_at_t = memoryAccess_mask(false)@t,
	memoryAccess_req_at_t = memoryAccess_req(false)@t,
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: execute_4(false);
	 at t: toMemoryPort_sync;
prove:
	 at t_end: execute_5(true);
	 at t_end: memoryAccess_addrIn(true) = memoryAccess_addrIn_at_t;
	 at t_end: memoryAccess_dataIn(true) = memoryAccess_dataIn_at_t;
	 at t_end: memoryAccess_mask(true) = memoryAccess_mask_at_t;
	 at t_end: memoryAccess_req(true) = memoryAccess_req_at_t;
	 at t_end: pcReg(true) = pcReg_at_t;
	 at t_end: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t_end: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 during[t+1, t_end-1]: fromMemoryPort_notify = false;
	 at t_end: fromMemoryPort_notify = true;
	 during[t+1, t_end]: toMemoryPort_notify = false;
	 during[t+1, t_end]: toRegsPort_notify = false;
right_hook:    t+1;
end property;

property execute_5_read_1 is
dependencies: no_reset,no_wait;
for timepoints:
	 t_end = t+1;
freeze:
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: execute_5(false);
	 at t: fromMemoryPort_sync;
prove:
	 at t_end: fetch_16(true);
	 at t_end: memoryAccess_addrIn(true) = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: memoryAccess_dataIn(true) = 0;
	 at t_end: memoryAccess_mask(true) = MT_W;
	 at t_end: memoryAccess_req(true) = ME_RD;
	 at t_end: pcReg(true) = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t_end: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 at t_end: toMemoryPort_sig_addrIn = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: toMemoryPort_sig_dataIn = 0;
	 at t_end: toMemoryPort_sig_mask = MT_W;
	 at t_end: toMemoryPort_sig_req = ME_RD;
	 during[t+1, t_end]: fromMemoryPort_notify = false;
	 during[t+1, t_end-1]: toMemoryPort_notify = false;
	 at t_end: toMemoryPort_notify = true;
	 during[t+1, t_end]: toRegsPort_notify = false;
right_hook:    t+1;

end property;

property execute_11_write_2 is
dependencies: no_reset,no_wait;
for timepoints:
	 t_end = t+1;
freeze:
	memoryAccess_addrIn_at_t = memoryAccess_addrIn(false)@t,
	memoryAccess_dataIn_at_t = memoryAccess_dataIn(false)@t,
	memoryAccess_mask_at_t = memoryAccess_mask(false)@t,
	memoryAccess_req_at_t = memoryAccess_req(false)@t,
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: execute_11(false);
	 at t: toMemoryPort_sync;
prove:
	 at t_end: execute_12(true);
	 at t_end: memoryAccess_addrIn(true) = memoryAccess_addrIn_at_t;
	 at t_end: memoryAccess_dataIn(true) = memoryAccess_dataIn_at_t;
	 at t_end: memoryAccess_mask(true) = memoryAccess_mask_at_t;
	 at t_end: memoryAccess_req(true) = memoryAccess_req_at_t;
	 at t_end: pcReg(true) = pcReg_at_t;
	 at t_end: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t_end: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 during[t+1, t_end-1]: fromMemoryPort_notify = false;
	 at t_end: fromMemoryPort_notify = true;
	 during[t+1, t_end]: toMemoryPort_notify = false;
	 during[t+1, t_end]: toRegsPort_notify = false;
right_hook:    t+1;
end property;

property execute_12_read_3 is
dependencies: no_reset,no_wait;
for timepoints:
	 t_end = t+1;
freeze:
	fromMemoryPort_sig_loadedData_at_t = fromMemoryPort_sig_loadedData@t,
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: execute_12(false);
	 at t: fromMemoryPort_sync;
prove:
	 at t_end: fetch_16(true);
	 at t_end: memoryAccess_addrIn(true) = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: memoryAccess_dataIn(true) = 0;
	 at t_end: memoryAccess_mask(true) = MT_W;
	 at t_end: memoryAccess_req(true) = ME_RD;
	 at t_end: pcReg(true) = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t_end: regfileWrite_dstData(true) = fromMemoryPort_sig_loadedData_at_t;
	 at t_end: toMemoryPort_sig_addrIn = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: toMemoryPort_sig_dataIn = 0;
	 at t_end: toMemoryPort_sig_mask = MT_W;
	 at t_end: toMemoryPort_sig_req = ME_RD;
	 at t_end: toRegsPort_sig_dst = regfileWrite_dst_at_t;
	 at t_end: toRegsPort_sig_dstData = fromMemoryPort_sig_loadedData_at_t;
	 during[t+1, t_end]: fromMemoryPort_notify = false;
	 during[t+1, t_end-1]: toMemoryPort_notify = false;
	 at t_end: toMemoryPort_notify = true;
	 during[t+1, t_end-1]: toRegsPort_notify = false;
	 at t_end: toRegsPort_notify = true;
right_hook:    t+1;
end property;

property fetch_16_write_4 is
dependencies: no_reset,no_wait;
for timepoints:
	 t_end = t+1;
freeze:
	memoryAccess_addrIn_at_t = memoryAccess_addrIn(false)@t,
	memoryAccess_dataIn_at_t = memoryAccess_dataIn(false)@t,
	memoryAccess_mask_at_t = memoryAccess_mask(false)@t,
	memoryAccess_req_at_t = memoryAccess_req(false)@t,
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: fetch_16(false);
	 at t: toMemoryPort_sync;
prove:
	 at t_end: fetch_17(true);
	 at t_end: memoryAccess_addrIn(true) = memoryAccess_addrIn_at_t;
	 at t_end: memoryAccess_dataIn(true) = memoryAccess_dataIn_at_t;
	 at t_end: memoryAccess_mask(true) = memoryAccess_mask_at_t;
	 at t_end: memoryAccess_req(true) = memoryAccess_req_at_t;
	 at t_end: pcReg(true) = pcReg_at_t;
	 at t_end: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t_end: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 during[t+1, t_end-1]: fromMemoryPort_notify = false;
	 at t_end: fromMemoryPort_notify = true;
	 during[t+1, t_end]: toMemoryPort_notify = false;
	 during[t+1, t_end]: toRegsPort_notify = false;
right_hook:    t+1;
end property;

property fetch_17_read_5 is
dependencies: no_reset,no_wait;
for timepoints:
	 t_end = t+1;
freeze:
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: fetch_17(false);
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_R));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_B));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_S));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_U));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_J));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_I_I));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_I_L));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_I_J));
	 at t: fromMemoryPort_sync;
prove:
	 at t_end: fetch_16(true);
	 at t_end: memoryAccess_addrIn(true) = pcReg_at_t;
	 at t_end: memoryAccess_dataIn(true) = 0;
	 at t_end: memoryAccess_mask(true) = MT_W;
	 at t_end: memoryAccess_req(true) = ME_RD;
	 at t_end: pcReg(true) = pcReg_at_t;
	 at t_end: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t_end: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 at t_end: toMemoryPort_sig_addrIn = pcReg_at_t;
	 at t_end: toMemoryPort_sig_dataIn = 0;
	 at t_end: toMemoryPort_sig_mask = MT_W;
	 at t_end: toMemoryPort_sig_req = ME_RD;
	 during[t+1, t_end]: fromMemoryPort_notify = false;
	 during[t+1, t_end-1]: toMemoryPort_notify = false;
	 at t_end: toMemoryPort_notify = true;
	 during[t+1, t_end]: toRegsPort_notify = false;
right_hook:    t+1;
end property;

property fetch_17_read_6 is
dependencies: no_reset,no_wait;
for timepoints:
	 t_end = t+1;
freeze:
	fromMemoryPort_sig_loadedData_at_t = fromMemoryPort_sig_loadedData@t,
	fromRegsPort_sig_reg_file_01_at_t = fromRegsPort_sig_reg_file_01@t,
	fromRegsPort_sig_reg_file_02_at_t = fromRegsPort_sig_reg_file_02@t,
	fromRegsPort_sig_reg_file_03_at_t = fromRegsPort_sig_reg_file_03@t,
	fromRegsPort_sig_reg_file_04_at_t = fromRegsPort_sig_reg_file_04@t,
	fromRegsPort_sig_reg_file_05_at_t = fromRegsPort_sig_reg_file_05@t,
	fromRegsPort_sig_reg_file_06_at_t = fromRegsPort_sig_reg_file_06@t,
	fromRegsPort_sig_reg_file_07_at_t = fromRegsPort_sig_reg_file_07@t,
	fromRegsPort_sig_reg_file_08_at_t = fromRegsPort_sig_reg_file_08@t,
	fromRegsPort_sig_reg_file_09_at_t = fromRegsPort_sig_reg_file_09@t,
	fromRegsPort_sig_reg_file_10_at_t = fromRegsPort_sig_reg_file_10@t,
	fromRegsPort_sig_reg_file_11_at_t = fromRegsPort_sig_reg_file_11@t,
	fromRegsPort_sig_reg_file_12_at_t = fromRegsPort_sig_reg_file_12@t,
	fromRegsPort_sig_reg_file_13_at_t = fromRegsPort_sig_reg_file_13@t,
	fromRegsPort_sig_reg_file_14_at_t = fromRegsPort_sig_reg_file_14@t,
	fromRegsPort_sig_reg_file_15_at_t = fromRegsPort_sig_reg_file_15@t,
	fromRegsPort_sig_reg_file_16_at_t = fromRegsPort_sig_reg_file_16@t,
	fromRegsPort_sig_reg_file_17_at_t = fromRegsPort_sig_reg_file_17@t,
	fromRegsPort_sig_reg_file_18_at_t = fromRegsPort_sig_reg_file_18@t,
	fromRegsPort_sig_reg_file_19_at_t = fromRegsPort_sig_reg_file_19@t,
	fromRegsPort_sig_reg_file_20_at_t = fromRegsPort_sig_reg_file_20@t,
	fromRegsPort_sig_reg_file_21_at_t = fromRegsPort_sig_reg_file_21@t,
	fromRegsPort_sig_reg_file_22_at_t = fromRegsPort_sig_reg_file_22@t,
	fromRegsPort_sig_reg_file_23_at_t = fromRegsPort_sig_reg_file_23@t,
	fromRegsPort_sig_reg_file_24_at_t = fromRegsPort_sig_reg_file_24@t,
	fromRegsPort_sig_reg_file_25_at_t = fromRegsPort_sig_reg_file_25@t,
	fromRegsPort_sig_reg_file_26_at_t = fromRegsPort_sig_reg_file_26@t,
	fromRegsPort_sig_reg_file_27_at_t = fromRegsPort_sig_reg_file_27@t,
	fromRegsPort_sig_reg_file_28_at_t = fromRegsPort_sig_reg_file_28@t,
	fromRegsPort_sig_reg_file_29_at_t = fromRegsPort_sig_reg_file_29@t,
	fromRegsPort_sig_reg_file_30_at_t = fromRegsPort_sig_reg_file_30@t,
	fromRegsPort_sig_reg_file_31_at_t = fromRegsPort_sig_reg_file_31@t,
	pcReg_at_t = pcReg(false)@t;
assume: 
	 at t: fetch_17(false);
	 at t: (getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_R);
	 at t: fromMemoryPort_sync;
prove:
	 at t_end: fetch_16(true);
	 at t_end: memoryAccess_addrIn(true) = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: memoryAccess_dataIn(true) = 0;
	 at t_end: memoryAccess_mask(true) = MT_W;
	 at t_end: memoryAccess_req(true) = ME_RD;
	 at t_end: pcReg(true) = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: regfileWrite_dst(true) = getRdAddr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t));
	 at t_end: regfileWrite_dstData(true) = getALUresult(getALUfunc(getInstrType(getFunct3(fromMemoryPort_sig_loadedData_at_t),getFunct7(fromMemoryPort_sig_loadedData_at_t),getOpcode(fromMemoryPort_sig_loadedData_at_t))),readRegfile(fromRegsPort_sig_reg_file_01_at_t,fromRegsPort_sig_reg_file_02_at_t,fromRegsPort_sig_reg_file_03_at_t,fromRegsPort_sig_reg_file_04_at_t,fromRegsPort_sig_reg_file_05_at_t,fromRegsPort_sig_reg_file_06_at_t,fromRegsPort_sig_reg_file_07_at_t,fromRegsPort_sig_reg_file_08_at_t,fromRegsPort_sig_reg_file_09_at_t,fromRegsPort_sig_reg_file_10_at_t,fromRegsPort_sig_reg_file_11_at_t,fromRegsPort_sig_reg_file_12_at_t,fromRegsPort_sig_reg_file_13_at_t,fromRegsPort_sig_reg_file_14_at_t,fromRegsPort_sig_reg_file_15_at_t,fromRegsPort_sig_reg_file_16_at_t,fromRegsPort_sig_reg_file_17_at_t,fromRegsPort_sig_reg_file_18_at_t,fromRegsPort_sig_reg_file_19_at_t,fromRegsPort_sig_reg_file_20_at_t,fromRegsPort_sig_reg_file_21_at_t,fromRegsPort_sig_reg_file_22_at_t,fromRegsPort_sig_reg_file_23_at_t,fromRegsPort_sig_reg_file_24_at_t,fromRegsPort_sig_reg_file_25_at_t,fromRegsPort_sig_reg_file_26_at_t,fromRegsPort_sig_reg_file_27_at_t,fromRegsPort_sig_reg_file_28_at_t,fromRegsPort_sig_reg_file_29_at_t,fromRegsPort_sig_reg_file_30_at_t,fromRegsPort_sig_reg_file_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t))),readRegfile(fromRegsPort_sig_reg_file_01_at_t,fromRegsPort_sig_reg_file_02_at_t,fromRegsPort_sig_reg_file_03_at_t,fromRegsPort_sig_reg_file_04_at_t,fromRegsPort_sig_reg_file_05_at_t,fromRegsPort_sig_reg_file_06_at_t,fromRegsPort_sig_reg_file_07_at_t,fromRegsPort_sig_reg_file_08_at_t,fromRegsPort_sig_reg_file_09_at_t,fromRegsPort_sig_reg_file_10_at_t,fromRegsPort_sig_reg_file_11_at_t,fromRegsPort_sig_reg_file_12_at_t,fromRegsPort_sig_reg_file_13_at_t,fromRegsPort_sig_reg_file_14_at_t,fromRegsPort_sig_reg_file_15_at_t,fromRegsPort_sig_reg_file_16_at_t,fromRegsPort_sig_reg_file_17_at_t,fromRegsPort_sig_reg_file_18_at_t,fromRegsPort_sig_reg_file_19_at_t,fromRegsPort_sig_reg_file_20_at_t,fromRegsPort_sig_reg_file_21_at_t,fromRegsPort_sig_reg_file_22_at_t,fromRegsPort_sig_reg_file_23_at_t,fromRegsPort_sig_reg_file_24_at_t,fromRegsPort_sig_reg_file_25_at_t,fromRegsPort_sig_reg_file_26_at_t,fromRegsPort_sig_reg_file_27_at_t,fromRegsPort_sig_reg_file_28_at_t,fromRegsPort_sig_reg_file_29_at_t,fromRegsPort_sig_reg_file_30_at_t,fromRegsPort_sig_reg_file_31_at_t,getRs2Addr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t))));
	 at t_end: toMemoryPort_sig_addrIn = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: toMemoryPort_sig_dataIn = 0;
	 at t_end: toMemoryPort_sig_mask = MT_W;
	 at t_end: toMemoryPort_sig_req = ME_RD;
	 at t_end: toRegsPort_sig_dst = getRdAddr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t));
	 at t_end: toRegsPort_sig_dstData = getALUresult(getALUfunc(getInstrType(getFunct3(fromMemoryPort_sig_loadedData_at_t),getFunct7(fromMemoryPort_sig_loadedData_at_t),getOpcode(fromMemoryPort_sig_loadedData_at_t))),readRegfile(fromRegsPort_sig_reg_file_01_at_t,fromRegsPort_sig_reg_file_02_at_t,fromRegsPort_sig_reg_file_03_at_t,fromRegsPort_sig_reg_file_04_at_t,fromRegsPort_sig_reg_file_05_at_t,fromRegsPort_sig_reg_file_06_at_t,fromRegsPort_sig_reg_file_07_at_t,fromRegsPort_sig_reg_file_08_at_t,fromRegsPort_sig_reg_file_09_at_t,fromRegsPort_sig_reg_file_10_at_t,fromRegsPort_sig_reg_file_11_at_t,fromRegsPort_sig_reg_file_12_at_t,fromRegsPort_sig_reg_file_13_at_t,fromRegsPort_sig_reg_file_14_at_t,fromRegsPort_sig_reg_file_15_at_t,fromRegsPort_sig_reg_file_16_at_t,fromRegsPort_sig_reg_file_17_at_t,fromRegsPort_sig_reg_file_18_at_t,fromRegsPort_sig_reg_file_19_at_t,fromRegsPort_sig_reg_file_20_at_t,fromRegsPort_sig_reg_file_21_at_t,fromRegsPort_sig_reg_file_22_at_t,fromRegsPort_sig_reg_file_23_at_t,fromRegsPort_sig_reg_file_24_at_t,fromRegsPort_sig_reg_file_25_at_t,fromRegsPort_sig_reg_file_26_at_t,fromRegsPort_sig_reg_file_27_at_t,fromRegsPort_sig_reg_file_28_at_t,fromRegsPort_sig_reg_file_29_at_t,fromRegsPort_sig_reg_file_30_at_t,fromRegsPort_sig_reg_file_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t))),readRegfile(fromRegsPort_sig_reg_file_01_at_t,fromRegsPort_sig_reg_file_02_at_t,fromRegsPort_sig_reg_file_03_at_t,fromRegsPort_sig_reg_file_04_at_t,fromRegsPort_sig_reg_file_05_at_t,fromRegsPort_sig_reg_file_06_at_t,fromRegsPort_sig_reg_file_07_at_t,fromRegsPort_sig_reg_file_08_at_t,fromRegsPort_sig_reg_file_09_at_t,fromRegsPort_sig_reg_file_10_at_t,fromRegsPort_sig_reg_file_11_at_t,fromRegsPort_sig_reg_file_12_at_t,fromRegsPort_sig_reg_file_13_at_t,fromRegsPort_sig_reg_file_14_at_t,fromRegsPort_sig_reg_file_15_at_t,fromRegsPort_sig_reg_file_16_at_t,fromRegsPort_sig_reg_file_17_at_t,fromRegsPort_sig_reg_file_18_at_t,fromRegsPort_sig_reg_file_19_at_t,fromRegsPort_sig_reg_file_20_at_t,fromRegsPort_sig_reg_file_21_at_t,fromRegsPort_sig_reg_file_22_at_t,fromRegsPort_sig_reg_file_23_at_t,fromRegsPort_sig_reg_file_24_at_t,fromRegsPort_sig_reg_file_25_at_t,fromRegsPort_sig_reg_file_26_at_t,fromRegsPort_sig_reg_file_27_at_t,fromRegsPort_sig_reg_file_28_at_t,fromRegsPort_sig_reg_file_29_at_t,fromRegsPort_sig_reg_file_30_at_t,fromRegsPort_sig_reg_file_31_at_t,getRs2Addr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t))));
	 during[t+1, t_end]: fromMemoryPort_notify = false;
	 during[t+1, t_end-1]: toMemoryPort_notify = false;
	 at t_end: toMemoryPort_notify = true;
	 during[t+1, t_end-1]: toRegsPort_notify = false;
	 at t_end: toRegsPort_notify = true;
right_hook:    t+1;
end property;

property fetch_17_read_7 is
dependencies: no_reset,no_wait;
for timepoints:
	 t_end = t+1;
freeze:
	fromMemoryPort_sig_loadedData_at_t = fromMemoryPort_sig_loadedData@t,
	fromRegsPort_sig_reg_file_01_at_t = fromRegsPort_sig_reg_file_01@t,
	fromRegsPort_sig_reg_file_02_at_t = fromRegsPort_sig_reg_file_02@t,
	fromRegsPort_sig_reg_file_03_at_t = fromRegsPort_sig_reg_file_03@t,
	fromRegsPort_sig_reg_file_04_at_t = fromRegsPort_sig_reg_file_04@t,
	fromRegsPort_sig_reg_file_05_at_t = fromRegsPort_sig_reg_file_05@t,
	fromRegsPort_sig_reg_file_06_at_t = fromRegsPort_sig_reg_file_06@t,
	fromRegsPort_sig_reg_file_07_at_t = fromRegsPort_sig_reg_file_07@t,
	fromRegsPort_sig_reg_file_08_at_t = fromRegsPort_sig_reg_file_08@t,
	fromRegsPort_sig_reg_file_09_at_t = fromRegsPort_sig_reg_file_09@t,
	fromRegsPort_sig_reg_file_10_at_t = fromRegsPort_sig_reg_file_10@t,
	fromRegsPort_sig_reg_file_11_at_t = fromRegsPort_sig_reg_file_11@t,
	fromRegsPort_sig_reg_file_12_at_t = fromRegsPort_sig_reg_file_12@t,
	fromRegsPort_sig_reg_file_13_at_t = fromRegsPort_sig_reg_file_13@t,
	fromRegsPort_sig_reg_file_14_at_t = fromRegsPort_sig_reg_file_14@t,
	fromRegsPort_sig_reg_file_15_at_t = fromRegsPort_sig_reg_file_15@t,
	fromRegsPort_sig_reg_file_16_at_t = fromRegsPort_sig_reg_file_16@t,
	fromRegsPort_sig_reg_file_17_at_t = fromRegsPort_sig_reg_file_17@t,
	fromRegsPort_sig_reg_file_18_at_t = fromRegsPort_sig_reg_file_18@t,
	fromRegsPort_sig_reg_file_19_at_t = fromRegsPort_sig_reg_file_19@t,
	fromRegsPort_sig_reg_file_20_at_t = fromRegsPort_sig_reg_file_20@t,
	fromRegsPort_sig_reg_file_21_at_t = fromRegsPort_sig_reg_file_21@t,
	fromRegsPort_sig_reg_file_22_at_t = fromRegsPort_sig_reg_file_22@t,
	fromRegsPort_sig_reg_file_23_at_t = fromRegsPort_sig_reg_file_23@t,
	fromRegsPort_sig_reg_file_24_at_t = fromRegsPort_sig_reg_file_24@t,
	fromRegsPort_sig_reg_file_25_at_t = fromRegsPort_sig_reg_file_25@t,
	fromRegsPort_sig_reg_file_26_at_t = fromRegsPort_sig_reg_file_26@t,
	fromRegsPort_sig_reg_file_27_at_t = fromRegsPort_sig_reg_file_27@t,
	fromRegsPort_sig_reg_file_28_at_t = fromRegsPort_sig_reg_file_28@t,
	fromRegsPort_sig_reg_file_29_at_t = fromRegsPort_sig_reg_file_29@t,
	fromRegsPort_sig_reg_file_30_at_t = fromRegsPort_sig_reg_file_30@t,
	fromRegsPort_sig_reg_file_31_at_t = fromRegsPort_sig_reg_file_31@t,
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: fetch_17(false);
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_R));
	 at t: (getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_B);
	 at t: fromMemoryPort_sync;
prove:
	 at t_end: fetch_16(true);
	 at t_end: memoryAccess_addrIn(true) = branchPCcalculation(getALUresult(getALUfunc(getInstrType(getFunct3(fromMemoryPort_sig_loadedData_at_t),getFunct7(fromMemoryPort_sig_loadedData_at_t),getOpcode(fromMemoryPort_sig_loadedData_at_t))),readRegfile(fromRegsPort_sig_reg_file_01_at_t,fromRegsPort_sig_reg_file_02_at_t,fromRegsPort_sig_reg_file_03_at_t,fromRegsPort_sig_reg_file_04_at_t,fromRegsPort_sig_reg_file_05_at_t,fromRegsPort_sig_reg_file_06_at_t,fromRegsPort_sig_reg_file_07_at_t,fromRegsPort_sig_reg_file_08_at_t,fromRegsPort_sig_reg_file_09_at_t,fromRegsPort_sig_reg_file_10_at_t,fromRegsPort_sig_reg_file_11_at_t,fromRegsPort_sig_reg_file_12_at_t,fromRegsPort_sig_reg_file_13_at_t,fromRegsPort_sig_reg_file_14_at_t,fromRegsPort_sig_reg_file_15_at_t,fromRegsPort_sig_reg_file_16_at_t,fromRegsPort_sig_reg_file_17_at_t,fromRegsPort_sig_reg_file_18_at_t,fromRegsPort_sig_reg_file_19_at_t,fromRegsPort_sig_reg_file_20_at_t,fromRegsPort_sig_reg_file_21_at_t,fromRegsPort_sig_reg_file_22_at_t,fromRegsPort_sig_reg_file_23_at_t,fromRegsPort_sig_reg_file_24_at_t,fromRegsPort_sig_reg_file_25_at_t,fromRegsPort_sig_reg_file_26_at_t,fromRegsPort_sig_reg_file_27_at_t,fromRegsPort_sig_reg_file_28_at_t,fromRegsPort_sig_reg_file_29_at_t,fromRegsPort_sig_reg_file_30_at_t,fromRegsPort_sig_reg_file_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t))),readRegfile(fromRegsPort_sig_reg_file_01_at_t,fromRegsPort_sig_reg_file_02_at_t,fromRegsPort_sig_reg_file_03_at_t,fromRegsPort_sig_reg_file_04_at_t,fromRegsPort_sig_reg_file_05_at_t,fromRegsPort_sig_reg_file_06_at_t,fromRegsPort_sig_reg_file_07_at_t,fromRegsPort_sig_reg_file_08_at_t,fromRegsPort_sig_reg_file_09_at_t,fromRegsPort_sig_reg_file_10_at_t,fromRegsPort_sig_reg_file_11_at_t,fromRegsPort_sig_reg_file_12_at_t,fromRegsPort_sig_reg_file_13_at_t,fromRegsPort_sig_reg_file_14_at_t,fromRegsPort_sig_reg_file_15_at_t,fromRegsPort_sig_reg_file_16_at_t,fromRegsPort_sig_reg_file_17_at_t,fromRegsPort_sig_reg_file_18_at_t,fromRegsPort_sig_reg_file_19_at_t,fromRegsPort_sig_reg_file_20_at_t,fromRegsPort_sig_reg_file_21_at_t,fromRegsPort_sig_reg_file_22_at_t,fromRegsPort_sig_reg_file_23_at_t,fromRegsPort_sig_reg_file_24_at_t,fromRegsPort_sig_reg_file_25_at_t,fromRegsPort_sig_reg_file_26_at_t,fromRegsPort_sig_reg_file_27_at_t,fromRegsPort_sig_reg_file_28_at_t,fromRegsPort_sig_reg_file_29_at_t,fromRegsPort_sig_reg_file_30_at_t,fromRegsPort_sig_reg_file_31_at_t,getRs2Addr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t)))),fromMemoryPort_sig_loadedData_at_t,pcReg_at_t);
	 at t_end: memoryAccess_dataIn(true) = 0;
	 at t_end: memoryAccess_mask(true) = MT_W;
	 at t_end: memoryAccess_req(true) = ME_RD;
	 at t_end: pcReg(true) = branchPCcalculation(getALUresult(getALUfunc(getInstrType(getFunct3(fromMemoryPort_sig_loadedData_at_t),getFunct7(fromMemoryPort_sig_loadedData_at_t),getOpcode(fromMemoryPort_sig_loadedData_at_t))),readRegfile(fromRegsPort_sig_reg_file_01_at_t,fromRegsPort_sig_reg_file_02_at_t,fromRegsPort_sig_reg_file_03_at_t,fromRegsPort_sig_reg_file_04_at_t,fromRegsPort_sig_reg_file_05_at_t,fromRegsPort_sig_reg_file_06_at_t,fromRegsPort_sig_reg_file_07_at_t,fromRegsPort_sig_reg_file_08_at_t,fromRegsPort_sig_reg_file_09_at_t,fromRegsPort_sig_reg_file_10_at_t,fromRegsPort_sig_reg_file_11_at_t,fromRegsPort_sig_reg_file_12_at_t,fromRegsPort_sig_reg_file_13_at_t,fromRegsPort_sig_reg_file_14_at_t,fromRegsPort_sig_reg_file_15_at_t,fromRegsPort_sig_reg_file_16_at_t,fromRegsPort_sig_reg_file_17_at_t,fromRegsPort_sig_reg_file_18_at_t,fromRegsPort_sig_reg_file_19_at_t,fromRegsPort_sig_reg_file_20_at_t,fromRegsPort_sig_reg_file_21_at_t,fromRegsPort_sig_reg_file_22_at_t,fromRegsPort_sig_reg_file_23_at_t,fromRegsPort_sig_reg_file_24_at_t,fromRegsPort_sig_reg_file_25_at_t,fromRegsPort_sig_reg_file_26_at_t,fromRegsPort_sig_reg_file_27_at_t,fromRegsPort_sig_reg_file_28_at_t,fromRegsPort_sig_reg_file_29_at_t,fromRegsPort_sig_reg_file_30_at_t,fromRegsPort_sig_reg_file_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t))),readRegfile(fromRegsPort_sig_reg_file_01_at_t,fromRegsPort_sig_reg_file_02_at_t,fromRegsPort_sig_reg_file_03_at_t,fromRegsPort_sig_reg_file_04_at_t,fromRegsPort_sig_reg_file_05_at_t,fromRegsPort_sig_reg_file_06_at_t,fromRegsPort_sig_reg_file_07_at_t,fromRegsPort_sig_reg_file_08_at_t,fromRegsPort_sig_reg_file_09_at_t,fromRegsPort_sig_reg_file_10_at_t,fromRegsPort_sig_reg_file_11_at_t,fromRegsPort_sig_reg_file_12_at_t,fromRegsPort_sig_reg_file_13_at_t,fromRegsPort_sig_reg_file_14_at_t,fromRegsPort_sig_reg_file_15_at_t,fromRegsPort_sig_reg_file_16_at_t,fromRegsPort_sig_reg_file_17_at_t,fromRegsPort_sig_reg_file_18_at_t,fromRegsPort_sig_reg_file_19_at_t,fromRegsPort_sig_reg_file_20_at_t,fromRegsPort_sig_reg_file_21_at_t,fromRegsPort_sig_reg_file_22_at_t,fromRegsPort_sig_reg_file_23_at_t,fromRegsPort_sig_reg_file_24_at_t,fromRegsPort_sig_reg_file_25_at_t,fromRegsPort_sig_reg_file_26_at_t,fromRegsPort_sig_reg_file_27_at_t,fromRegsPort_sig_reg_file_28_at_t,fromRegsPort_sig_reg_file_29_at_t,fromRegsPort_sig_reg_file_30_at_t,fromRegsPort_sig_reg_file_31_at_t,getRs2Addr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t)))),fromMemoryPort_sig_loadedData_at_t,pcReg_at_t);
	 at t_end: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t_end: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 at t_end: toMemoryPort_sig_addrIn = branchPCcalculation(getALUresult(getALUfunc(getInstrType(getFunct3(fromMemoryPort_sig_loadedData_at_t),getFunct7(fromMemoryPort_sig_loadedData_at_t),getOpcode(fromMemoryPort_sig_loadedData_at_t))),readRegfile(fromRegsPort_sig_reg_file_01_at_t,fromRegsPort_sig_reg_file_02_at_t,fromRegsPort_sig_reg_file_03_at_t,fromRegsPort_sig_reg_file_04_at_t,fromRegsPort_sig_reg_file_05_at_t,fromRegsPort_sig_reg_file_06_at_t,fromRegsPort_sig_reg_file_07_at_t,fromRegsPort_sig_reg_file_08_at_t,fromRegsPort_sig_reg_file_09_at_t,fromRegsPort_sig_reg_file_10_at_t,fromRegsPort_sig_reg_file_11_at_t,fromRegsPort_sig_reg_file_12_at_t,fromRegsPort_sig_reg_file_13_at_t,fromRegsPort_sig_reg_file_14_at_t,fromRegsPort_sig_reg_file_15_at_t,fromRegsPort_sig_reg_file_16_at_t,fromRegsPort_sig_reg_file_17_at_t,fromRegsPort_sig_reg_file_18_at_t,fromRegsPort_sig_reg_file_19_at_t,fromRegsPort_sig_reg_file_20_at_t,fromRegsPort_sig_reg_file_21_at_t,fromRegsPort_sig_reg_file_22_at_t,fromRegsPort_sig_reg_file_23_at_t,fromRegsPort_sig_reg_file_24_at_t,fromRegsPort_sig_reg_file_25_at_t,fromRegsPort_sig_reg_file_26_at_t,fromRegsPort_sig_reg_file_27_at_t,fromRegsPort_sig_reg_file_28_at_t,fromRegsPort_sig_reg_file_29_at_t,fromRegsPort_sig_reg_file_30_at_t,fromRegsPort_sig_reg_file_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t))),readRegfile(fromRegsPort_sig_reg_file_01_at_t,fromRegsPort_sig_reg_file_02_at_t,fromRegsPort_sig_reg_file_03_at_t,fromRegsPort_sig_reg_file_04_at_t,fromRegsPort_sig_reg_file_05_at_t,fromRegsPort_sig_reg_file_06_at_t,fromRegsPort_sig_reg_file_07_at_t,fromRegsPort_sig_reg_file_08_at_t,fromRegsPort_sig_reg_file_09_at_t,fromRegsPort_sig_reg_file_10_at_t,fromRegsPort_sig_reg_file_11_at_t,fromRegsPort_sig_reg_file_12_at_t,fromRegsPort_sig_reg_file_13_at_t,fromRegsPort_sig_reg_file_14_at_t,fromRegsPort_sig_reg_file_15_at_t,fromRegsPort_sig_reg_file_16_at_t,fromRegsPort_sig_reg_file_17_at_t,fromRegsPort_sig_reg_file_18_at_t,fromRegsPort_sig_reg_file_19_at_t,fromRegsPort_sig_reg_file_20_at_t,fromRegsPort_sig_reg_file_21_at_t,fromRegsPort_sig_reg_file_22_at_t,fromRegsPort_sig_reg_file_23_at_t,fromRegsPort_sig_reg_file_24_at_t,fromRegsPort_sig_reg_file_25_at_t,fromRegsPort_sig_reg_file_26_at_t,fromRegsPort_sig_reg_file_27_at_t,fromRegsPort_sig_reg_file_28_at_t,fromRegsPort_sig_reg_file_29_at_t,fromRegsPort_sig_reg_file_30_at_t,fromRegsPort_sig_reg_file_31_at_t,getRs2Addr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t)))),fromMemoryPort_sig_loadedData_at_t,pcReg_at_t);
	 at t_end: toMemoryPort_sig_dataIn = 0;
	 at t_end: toMemoryPort_sig_mask = MT_W;
	 at t_end: toMemoryPort_sig_req = ME_RD;
	 during[t+1, t_end]: fromMemoryPort_notify = false;
	 during[t+1, t_end-1]: toMemoryPort_notify = false;
	 at t_end: toMemoryPort_notify = true;
	 during[t+1, t_end]: toRegsPort_notify = false;
right_hook:    t+1;
end property;

property fetch_17_read_8 is
dependencies: no_reset,no_wait;
for timepoints:
	 t_end = t+1;
freeze:
	fromMemoryPort_sig_loadedData_at_t = fromMemoryPort_sig_loadedData@t,
	fromRegsPort_sig_reg_file_01_at_t = fromRegsPort_sig_reg_file_01@t,
	fromRegsPort_sig_reg_file_02_at_t = fromRegsPort_sig_reg_file_02@t,
	fromRegsPort_sig_reg_file_03_at_t = fromRegsPort_sig_reg_file_03@t,
	fromRegsPort_sig_reg_file_04_at_t = fromRegsPort_sig_reg_file_04@t,
	fromRegsPort_sig_reg_file_05_at_t = fromRegsPort_sig_reg_file_05@t,
	fromRegsPort_sig_reg_file_06_at_t = fromRegsPort_sig_reg_file_06@t,
	fromRegsPort_sig_reg_file_07_at_t = fromRegsPort_sig_reg_file_07@t,
	fromRegsPort_sig_reg_file_08_at_t = fromRegsPort_sig_reg_file_08@t,
	fromRegsPort_sig_reg_file_09_at_t = fromRegsPort_sig_reg_file_09@t,
	fromRegsPort_sig_reg_file_10_at_t = fromRegsPort_sig_reg_file_10@t,
	fromRegsPort_sig_reg_file_11_at_t = fromRegsPort_sig_reg_file_11@t,
	fromRegsPort_sig_reg_file_12_at_t = fromRegsPort_sig_reg_file_12@t,
	fromRegsPort_sig_reg_file_13_at_t = fromRegsPort_sig_reg_file_13@t,
	fromRegsPort_sig_reg_file_14_at_t = fromRegsPort_sig_reg_file_14@t,
	fromRegsPort_sig_reg_file_15_at_t = fromRegsPort_sig_reg_file_15@t,
	fromRegsPort_sig_reg_file_16_at_t = fromRegsPort_sig_reg_file_16@t,
	fromRegsPort_sig_reg_file_17_at_t = fromRegsPort_sig_reg_file_17@t,
	fromRegsPort_sig_reg_file_18_at_t = fromRegsPort_sig_reg_file_18@t,
	fromRegsPort_sig_reg_file_19_at_t = fromRegsPort_sig_reg_file_19@t,
	fromRegsPort_sig_reg_file_20_at_t = fromRegsPort_sig_reg_file_20@t,
	fromRegsPort_sig_reg_file_21_at_t = fromRegsPort_sig_reg_file_21@t,
	fromRegsPort_sig_reg_file_22_at_t = fromRegsPort_sig_reg_file_22@t,
	fromRegsPort_sig_reg_file_23_at_t = fromRegsPort_sig_reg_file_23@t,
	fromRegsPort_sig_reg_file_24_at_t = fromRegsPort_sig_reg_file_24@t,
	fromRegsPort_sig_reg_file_25_at_t = fromRegsPort_sig_reg_file_25@t,
	fromRegsPort_sig_reg_file_26_at_t = fromRegsPort_sig_reg_file_26@t,
	fromRegsPort_sig_reg_file_27_at_t = fromRegsPort_sig_reg_file_27@t,
	fromRegsPort_sig_reg_file_28_at_t = fromRegsPort_sig_reg_file_28@t,
	fromRegsPort_sig_reg_file_29_at_t = fromRegsPort_sig_reg_file_29@t,
	fromRegsPort_sig_reg_file_30_at_t = fromRegsPort_sig_reg_file_30@t,
	fromRegsPort_sig_reg_file_31_at_t = fromRegsPort_sig_reg_file_31@t,
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: fetch_17(false);
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_R));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_B));
	 at t: (getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_S);
	 at t: fromMemoryPort_sync;
prove:
	 at t_end: execute_4(true);
	 at t_end: memoryAccess_addrIn(true) = getALUresult(ALU_ADD,readRegfile(fromRegsPort_sig_reg_file_01_at_t,fromRegsPort_sig_reg_file_02_at_t,fromRegsPort_sig_reg_file_03_at_t,fromRegsPort_sig_reg_file_04_at_t,fromRegsPort_sig_reg_file_05_at_t,fromRegsPort_sig_reg_file_06_at_t,fromRegsPort_sig_reg_file_07_at_t,fromRegsPort_sig_reg_file_08_at_t,fromRegsPort_sig_reg_file_09_at_t,fromRegsPort_sig_reg_file_10_at_t,fromRegsPort_sig_reg_file_11_at_t,fromRegsPort_sig_reg_file_12_at_t,fromRegsPort_sig_reg_file_13_at_t,fromRegsPort_sig_reg_file_14_at_t,fromRegsPort_sig_reg_file_15_at_t,fromRegsPort_sig_reg_file_16_at_t,fromRegsPort_sig_reg_file_17_at_t,fromRegsPort_sig_reg_file_18_at_t,fromRegsPort_sig_reg_file_19_at_t,fromRegsPort_sig_reg_file_20_at_t,fromRegsPort_sig_reg_file_21_at_t,fromRegsPort_sig_reg_file_22_at_t,fromRegsPort_sig_reg_file_23_at_t,fromRegsPort_sig_reg_file_24_at_t,fromRegsPort_sig_reg_file_25_at_t,fromRegsPort_sig_reg_file_26_at_t,fromRegsPort_sig_reg_file_27_at_t,fromRegsPort_sig_reg_file_28_at_t,fromRegsPort_sig_reg_file_29_at_t,fromRegsPort_sig_reg_file_30_at_t,fromRegsPort_sig_reg_file_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t))),getImmediate(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t)));
	 at t_end: memoryAccess_dataIn(true) = readRegfile(fromRegsPort_sig_reg_file_01_at_t,fromRegsPort_sig_reg_file_02_at_t,fromRegsPort_sig_reg_file_03_at_t,fromRegsPort_sig_reg_file_04_at_t,fromRegsPort_sig_reg_file_05_at_t,fromRegsPort_sig_reg_file_06_at_t,fromRegsPort_sig_reg_file_07_at_t,fromRegsPort_sig_reg_file_08_at_t,fromRegsPort_sig_reg_file_09_at_t,fromRegsPort_sig_reg_file_10_at_t,fromRegsPort_sig_reg_file_11_at_t,fromRegsPort_sig_reg_file_12_at_t,fromRegsPort_sig_reg_file_13_at_t,fromRegsPort_sig_reg_file_14_at_t,fromRegsPort_sig_reg_file_15_at_t,fromRegsPort_sig_reg_file_16_at_t,fromRegsPort_sig_reg_file_17_at_t,fromRegsPort_sig_reg_file_18_at_t,fromRegsPort_sig_reg_file_19_at_t,fromRegsPort_sig_reg_file_20_at_t,fromRegsPort_sig_reg_file_21_at_t,fromRegsPort_sig_reg_file_22_at_t,fromRegsPort_sig_reg_file_23_at_t,fromRegsPort_sig_reg_file_24_at_t,fromRegsPort_sig_reg_file_25_at_t,fromRegsPort_sig_reg_file_26_at_t,fromRegsPort_sig_reg_file_27_at_t,fromRegsPort_sig_reg_file_28_at_t,fromRegsPort_sig_reg_file_29_at_t,fromRegsPort_sig_reg_file_30_at_t,fromRegsPort_sig_reg_file_31_at_t,getRs2Addr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t)));
	 at t_end: memoryAccess_mask(true) = getMemoryMask(getInstrType(getFunct3(fromMemoryPort_sig_loadedData_at_t),getFunct7(fromMemoryPort_sig_loadedData_at_t),getOpcode(fromMemoryPort_sig_loadedData_at_t)));
	 at t_end: memoryAccess_req(true) = ME_WR;
	 at t_end: pcReg(true) = pcReg_at_t;
	 at t_end: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t_end: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 at t_end: toMemoryPort_sig_addrIn = getALUresult(ALU_ADD,readRegfile(fromRegsPort_sig_reg_file_01_at_t,fromRegsPort_sig_reg_file_02_at_t,fromRegsPort_sig_reg_file_03_at_t,fromRegsPort_sig_reg_file_04_at_t,fromRegsPort_sig_reg_file_05_at_t,fromRegsPort_sig_reg_file_06_at_t,fromRegsPort_sig_reg_file_07_at_t,fromRegsPort_sig_reg_file_08_at_t,fromRegsPort_sig_reg_file_09_at_t,fromRegsPort_sig_reg_file_10_at_t,fromRegsPort_sig_reg_file_11_at_t,fromRegsPort_sig_reg_file_12_at_t,fromRegsPort_sig_reg_file_13_at_t,fromRegsPort_sig_reg_file_14_at_t,fromRegsPort_sig_reg_file_15_at_t,fromRegsPort_sig_reg_file_16_at_t,fromRegsPort_sig_reg_file_17_at_t,fromRegsPort_sig_reg_file_18_at_t,fromRegsPort_sig_reg_file_19_at_t,fromRegsPort_sig_reg_file_20_at_t,fromRegsPort_sig_reg_file_21_at_t,fromRegsPort_sig_reg_file_22_at_t,fromRegsPort_sig_reg_file_23_at_t,fromRegsPort_sig_reg_file_24_at_t,fromRegsPort_sig_reg_file_25_at_t,fromRegsPort_sig_reg_file_26_at_t,fromRegsPort_sig_reg_file_27_at_t,fromRegsPort_sig_reg_file_28_at_t,fromRegsPort_sig_reg_file_29_at_t,fromRegsPort_sig_reg_file_30_at_t,fromRegsPort_sig_reg_file_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t))),getImmediate(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t)));
	 at t_end: toMemoryPort_sig_dataIn = readRegfile(fromRegsPort_sig_reg_file_01_at_t,fromRegsPort_sig_reg_file_02_at_t,fromRegsPort_sig_reg_file_03_at_t,fromRegsPort_sig_reg_file_04_at_t,fromRegsPort_sig_reg_file_05_at_t,fromRegsPort_sig_reg_file_06_at_t,fromRegsPort_sig_reg_file_07_at_t,fromRegsPort_sig_reg_file_08_at_t,fromRegsPort_sig_reg_file_09_at_t,fromRegsPort_sig_reg_file_10_at_t,fromRegsPort_sig_reg_file_11_at_t,fromRegsPort_sig_reg_file_12_at_t,fromRegsPort_sig_reg_file_13_at_t,fromRegsPort_sig_reg_file_14_at_t,fromRegsPort_sig_reg_file_15_at_t,fromRegsPort_sig_reg_file_16_at_t,fromRegsPort_sig_reg_file_17_at_t,fromRegsPort_sig_reg_file_18_at_t,fromRegsPort_sig_reg_file_19_at_t,fromRegsPort_sig_reg_file_20_at_t,fromRegsPort_sig_reg_file_21_at_t,fromRegsPort_sig_reg_file_22_at_t,fromRegsPort_sig_reg_file_23_at_t,fromRegsPort_sig_reg_file_24_at_t,fromRegsPort_sig_reg_file_25_at_t,fromRegsPort_sig_reg_file_26_at_t,fromRegsPort_sig_reg_file_27_at_t,fromRegsPort_sig_reg_file_28_at_t,fromRegsPort_sig_reg_file_29_at_t,fromRegsPort_sig_reg_file_30_at_t,fromRegsPort_sig_reg_file_31_at_t,getRs2Addr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t)));
	 at t_end: toMemoryPort_sig_mask = getMemoryMask(getInstrType(getFunct3(fromMemoryPort_sig_loadedData_at_t),getFunct7(fromMemoryPort_sig_loadedData_at_t),getOpcode(fromMemoryPort_sig_loadedData_at_t)));
	 at t_end: toMemoryPort_sig_req = ME_WR;
	 during[t+1, t_end]: fromMemoryPort_notify = false;
	 during[t+1, t_end-1]: toMemoryPort_notify = false;
	 at t_end: toMemoryPort_notify = true;
	 during[t+1, t_end]: toRegsPort_notify = false;
right_hook:    t+1;
end property;

property fetch_17_read_9 is
dependencies: no_reset,no_wait;
for timepoints:
	 t_end = t+1;
freeze:
	fromMemoryPort_sig_loadedData_at_t = fromMemoryPort_sig_loadedData@t,
	pcReg_at_t = pcReg(false)@t;
assume: 
	 at t: fetch_17(false);
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_R));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_B));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_S));
	 at t: (getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_U);
	 at t: fromMemoryPort_sync;
prove:
	 at t_end: fetch_16(true);
	 at t_end: memoryAccess_addrIn(true) = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: memoryAccess_dataIn(true) = 0;
	 at t_end: memoryAccess_mask(true) = MT_W;
	 at t_end: memoryAccess_req(true) = ME_RD;
	 at t_end: pcReg(true) = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: regfileWrite_dst(true) = getRdAddr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t));
	 at t_end: regfileWrite_dstData(true) = getEncUALUresult(fromMemoryPort_sig_loadedData_at_t,pcReg_at_t);
	 at t_end: toMemoryPort_sig_addrIn = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: toMemoryPort_sig_dataIn = 0;
	 at t_end: toMemoryPort_sig_mask = MT_W;
	 at t_end: toMemoryPort_sig_req = ME_RD;
	 at t_end: toRegsPort_sig_dst = getRdAddr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t));
	 at t_end: toRegsPort_sig_dstData = getEncUALUresult(fromMemoryPort_sig_loadedData_at_t,pcReg_at_t);
	 during[t+1, t_end]: fromMemoryPort_notify = false;
	 during[t+1, t_end-1]: toMemoryPort_notify = false;
	 at t_end: toMemoryPort_notify = true;
	 during[t+1, t_end-1]: toRegsPort_notify = false;
	 at t_end: toRegsPort_notify = true;
right_hook:    t+1;
end property;

property fetch_17_read_10 is
dependencies: no_reset,no_wait;
for timepoints:
	 t_end = t+1;
freeze:
	fromMemoryPort_sig_loadedData_at_t = fromMemoryPort_sig_loadedData@t,
	pcReg_at_t = pcReg(false)@t;
assume: 
	 at t: fetch_17(false);
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_R));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_B));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_S));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_U));
	 at t: (getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_J);
	 at t: fromMemoryPort_sync;
prove:
	 at t_end: fetch_16(true);
	 at t_end: memoryAccess_addrIn(true) = (pcReg_at_t + getImmediate(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t)))(31 downto 0);
	 at t_end: memoryAccess_dataIn(true) = 0;
	 at t_end: memoryAccess_mask(true) = MT_W;
	 at t_end: memoryAccess_req(true) = ME_RD;
	 at t_end: pcReg(true) = (pcReg_at_t + getImmediate(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t)))(31 downto 0);
	 at t_end: regfileWrite_dst(true) = getRdAddr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t));
	 at t_end: regfileWrite_dstData(true) = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: toMemoryPort_sig_addrIn = (pcReg_at_t + getImmediate(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t)))(31 downto 0);
	 at t_end: toMemoryPort_sig_dataIn = 0;
	 at t_end: toMemoryPort_sig_mask = MT_W;
	 at t_end: toMemoryPort_sig_req = ME_RD;
	 at t_end: toRegsPort_sig_dst = getRdAddr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t));
	 at t_end: toRegsPort_sig_dstData = (4 + pcReg_at_t)(31 downto 0);
	 during[t+1, t_end]: fromMemoryPort_notify = false;
	 during[t+1, t_end-1]: toMemoryPort_notify = false;
	 at t_end: toMemoryPort_notify = true;
	 during[t+1, t_end-1]: toRegsPort_notify = false;
	 at t_end: toRegsPort_notify = true;
right_hook:    t_last-1;

end property;

property fetch_17_read_11 is
dependencies: no_reset,no_wait;
for timepoints:
	 t_end = t+1;
freeze:
	fromMemoryPort_sig_loadedData_at_t = fromMemoryPort_sig_loadedData@t,
	fromRegsPort_sig_reg_file_01_at_t = fromRegsPort_sig_reg_file_01@t,
	fromRegsPort_sig_reg_file_02_at_t = fromRegsPort_sig_reg_file_02@t,
	fromRegsPort_sig_reg_file_03_at_t = fromRegsPort_sig_reg_file_03@t,
	fromRegsPort_sig_reg_file_04_at_t = fromRegsPort_sig_reg_file_04@t,
	fromRegsPort_sig_reg_file_05_at_t = fromRegsPort_sig_reg_file_05@t,
	fromRegsPort_sig_reg_file_06_at_t = fromRegsPort_sig_reg_file_06@t,
	fromRegsPort_sig_reg_file_07_at_t = fromRegsPort_sig_reg_file_07@t,
	fromRegsPort_sig_reg_file_08_at_t = fromRegsPort_sig_reg_file_08@t,
	fromRegsPort_sig_reg_file_09_at_t = fromRegsPort_sig_reg_file_09@t,
	fromRegsPort_sig_reg_file_10_at_t = fromRegsPort_sig_reg_file_10@t,
	fromRegsPort_sig_reg_file_11_at_t = fromRegsPort_sig_reg_file_11@t,
	fromRegsPort_sig_reg_file_12_at_t = fromRegsPort_sig_reg_file_12@t,
	fromRegsPort_sig_reg_file_13_at_t = fromRegsPort_sig_reg_file_13@t,
	fromRegsPort_sig_reg_file_14_at_t = fromRegsPort_sig_reg_file_14@t,
	fromRegsPort_sig_reg_file_15_at_t = fromRegsPort_sig_reg_file_15@t,
	fromRegsPort_sig_reg_file_16_at_t = fromRegsPort_sig_reg_file_16@t,
	fromRegsPort_sig_reg_file_17_at_t = fromRegsPort_sig_reg_file_17@t,
	fromRegsPort_sig_reg_file_18_at_t = fromRegsPort_sig_reg_file_18@t,
	fromRegsPort_sig_reg_file_19_at_t = fromRegsPort_sig_reg_file_19@t,
	fromRegsPort_sig_reg_file_20_at_t = fromRegsPort_sig_reg_file_20@t,
	fromRegsPort_sig_reg_file_21_at_t = fromRegsPort_sig_reg_file_21@t,
	fromRegsPort_sig_reg_file_22_at_t = fromRegsPort_sig_reg_file_22@t,
	fromRegsPort_sig_reg_file_23_at_t = fromRegsPort_sig_reg_file_23@t,
	fromRegsPort_sig_reg_file_24_at_t = fromRegsPort_sig_reg_file_24@t,
	fromRegsPort_sig_reg_file_25_at_t = fromRegsPort_sig_reg_file_25@t,
	fromRegsPort_sig_reg_file_26_at_t = fromRegsPort_sig_reg_file_26@t,
	fromRegsPort_sig_reg_file_27_at_t = fromRegsPort_sig_reg_file_27@t,
	fromRegsPort_sig_reg_file_28_at_t = fromRegsPort_sig_reg_file_28@t,
	fromRegsPort_sig_reg_file_29_at_t = fromRegsPort_sig_reg_file_29@t,
	fromRegsPort_sig_reg_file_30_at_t = fromRegsPort_sig_reg_file_30@t,
	fromRegsPort_sig_reg_file_31_at_t = fromRegsPort_sig_reg_file_31@t,
	pcReg_at_t = pcReg(false)@t;
assume: 
	 at t: fetch_17(false);
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_R));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_B));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_S));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_U));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_J));
	 at t: (getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_I_I);
	 at t: fromMemoryPort_sync;
prove:
	 at t_end: fetch_16(true);
	 at t_end: memoryAccess_addrIn(true) = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: memoryAccess_dataIn(true) = 0;
	 at t_end: memoryAccess_mask(true) = MT_W;
	 at t_end: memoryAccess_req(true) = ME_RD;
	 at t_end: pcReg(true) = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: regfileWrite_dst(true) = getRdAddr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t));
	 at t_end: regfileWrite_dstData(true) = getALUresult(getALUfunc(getInstrType(getFunct3(fromMemoryPort_sig_loadedData_at_t),getFunct7(fromMemoryPort_sig_loadedData_at_t),getOpcode(fromMemoryPort_sig_loadedData_at_t))),readRegfile(fromRegsPort_sig_reg_file_01_at_t,fromRegsPort_sig_reg_file_02_at_t,fromRegsPort_sig_reg_file_03_at_t,fromRegsPort_sig_reg_file_04_at_t,fromRegsPort_sig_reg_file_05_at_t,fromRegsPort_sig_reg_file_06_at_t,fromRegsPort_sig_reg_file_07_at_t,fromRegsPort_sig_reg_file_08_at_t,fromRegsPort_sig_reg_file_09_at_t,fromRegsPort_sig_reg_file_10_at_t,fromRegsPort_sig_reg_file_11_at_t,fromRegsPort_sig_reg_file_12_at_t,fromRegsPort_sig_reg_file_13_at_t,fromRegsPort_sig_reg_file_14_at_t,fromRegsPort_sig_reg_file_15_at_t,fromRegsPort_sig_reg_file_16_at_t,fromRegsPort_sig_reg_file_17_at_t,fromRegsPort_sig_reg_file_18_at_t,fromRegsPort_sig_reg_file_19_at_t,fromRegsPort_sig_reg_file_20_at_t,fromRegsPort_sig_reg_file_21_at_t,fromRegsPort_sig_reg_file_22_at_t,fromRegsPort_sig_reg_file_23_at_t,fromRegsPort_sig_reg_file_24_at_t,fromRegsPort_sig_reg_file_25_at_t,fromRegsPort_sig_reg_file_26_at_t,fromRegsPort_sig_reg_file_27_at_t,fromRegsPort_sig_reg_file_28_at_t,fromRegsPort_sig_reg_file_29_at_t,fromRegsPort_sig_reg_file_30_at_t,fromRegsPort_sig_reg_file_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t))),getImmediate(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t)));
	 at t_end: toMemoryPort_sig_addrIn = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: toMemoryPort_sig_dataIn = 0;
	 at t_end: toMemoryPort_sig_mask = MT_W;
	 at t_end: toMemoryPort_sig_req = ME_RD;
	 at t_end: toRegsPort_sig_dst = getRdAddr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t));
	 at t_end: toRegsPort_sig_dstData = getALUresult(getALUfunc(getInstrType(getFunct3(fromMemoryPort_sig_loadedData_at_t),getFunct7(fromMemoryPort_sig_loadedData_at_t),getOpcode(fromMemoryPort_sig_loadedData_at_t))),readRegfile(fromRegsPort_sig_reg_file_01_at_t,fromRegsPort_sig_reg_file_02_at_t,fromRegsPort_sig_reg_file_03_at_t,fromRegsPort_sig_reg_file_04_at_t,fromRegsPort_sig_reg_file_05_at_t,fromRegsPort_sig_reg_file_06_at_t,fromRegsPort_sig_reg_file_07_at_t,fromRegsPort_sig_reg_file_08_at_t,fromRegsPort_sig_reg_file_09_at_t,fromRegsPort_sig_reg_file_10_at_t,fromRegsPort_sig_reg_file_11_at_t,fromRegsPort_sig_reg_file_12_at_t,fromRegsPort_sig_reg_file_13_at_t,fromRegsPort_sig_reg_file_14_at_t,fromRegsPort_sig_reg_file_15_at_t,fromRegsPort_sig_reg_file_16_at_t,fromRegsPort_sig_reg_file_17_at_t,fromRegsPort_sig_reg_file_18_at_t,fromRegsPort_sig_reg_file_19_at_t,fromRegsPort_sig_reg_file_20_at_t,fromRegsPort_sig_reg_file_21_at_t,fromRegsPort_sig_reg_file_22_at_t,fromRegsPort_sig_reg_file_23_at_t,fromRegsPort_sig_reg_file_24_at_t,fromRegsPort_sig_reg_file_25_at_t,fromRegsPort_sig_reg_file_26_at_t,fromRegsPort_sig_reg_file_27_at_t,fromRegsPort_sig_reg_file_28_at_t,fromRegsPort_sig_reg_file_29_at_t,fromRegsPort_sig_reg_file_30_at_t,fromRegsPort_sig_reg_file_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t))),getImmediate(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t)));
	 during[t+1, t_end]: fromMemoryPort_notify = false;
	 during[t+1, t_end-1]: toMemoryPort_notify = false;
	 at t_end: toMemoryPort_notify = true;
	 during[t+1, t_end-1]: toRegsPort_notify = false;
	 at t_end: toRegsPort_notify = true;
right_hook:    t+1;
end property;

property fetch_17_read_12 is
dependencies: no_reset,no_wait;
for timepoints:
	 t_end = t+1;
freeze:
	fromMemoryPort_sig_loadedData_at_t = fromMemoryPort_sig_loadedData@t,
	fromRegsPort_sig_reg_file_01_at_t = fromRegsPort_sig_reg_file_01@t,
	fromRegsPort_sig_reg_file_02_at_t = fromRegsPort_sig_reg_file_02@t,
	fromRegsPort_sig_reg_file_03_at_t = fromRegsPort_sig_reg_file_03@t,
	fromRegsPort_sig_reg_file_04_at_t = fromRegsPort_sig_reg_file_04@t,
	fromRegsPort_sig_reg_file_05_at_t = fromRegsPort_sig_reg_file_05@t,
	fromRegsPort_sig_reg_file_06_at_t = fromRegsPort_sig_reg_file_06@t,
	fromRegsPort_sig_reg_file_07_at_t = fromRegsPort_sig_reg_file_07@t,
	fromRegsPort_sig_reg_file_08_at_t = fromRegsPort_sig_reg_file_08@t,
	fromRegsPort_sig_reg_file_09_at_t = fromRegsPort_sig_reg_file_09@t,
	fromRegsPort_sig_reg_file_10_at_t = fromRegsPort_sig_reg_file_10@t,
	fromRegsPort_sig_reg_file_11_at_t = fromRegsPort_sig_reg_file_11@t,
	fromRegsPort_sig_reg_file_12_at_t = fromRegsPort_sig_reg_file_12@t,
	fromRegsPort_sig_reg_file_13_at_t = fromRegsPort_sig_reg_file_13@t,
	fromRegsPort_sig_reg_file_14_at_t = fromRegsPort_sig_reg_file_14@t,
	fromRegsPort_sig_reg_file_15_at_t = fromRegsPort_sig_reg_file_15@t,
	fromRegsPort_sig_reg_file_16_at_t = fromRegsPort_sig_reg_file_16@t,
	fromRegsPort_sig_reg_file_17_at_t = fromRegsPort_sig_reg_file_17@t,
	fromRegsPort_sig_reg_file_18_at_t = fromRegsPort_sig_reg_file_18@t,
	fromRegsPort_sig_reg_file_19_at_t = fromRegsPort_sig_reg_file_19@t,
	fromRegsPort_sig_reg_file_20_at_t = fromRegsPort_sig_reg_file_20@t,
	fromRegsPort_sig_reg_file_21_at_t = fromRegsPort_sig_reg_file_21@t,
	fromRegsPort_sig_reg_file_22_at_t = fromRegsPort_sig_reg_file_22@t,
	fromRegsPort_sig_reg_file_23_at_t = fromRegsPort_sig_reg_file_23@t,
	fromRegsPort_sig_reg_file_24_at_t = fromRegsPort_sig_reg_file_24@t,
	fromRegsPort_sig_reg_file_25_at_t = fromRegsPort_sig_reg_file_25@t,
	fromRegsPort_sig_reg_file_26_at_t = fromRegsPort_sig_reg_file_26@t,
	fromRegsPort_sig_reg_file_27_at_t = fromRegsPort_sig_reg_file_27@t,
	fromRegsPort_sig_reg_file_28_at_t = fromRegsPort_sig_reg_file_28@t,
	fromRegsPort_sig_reg_file_29_at_t = fromRegsPort_sig_reg_file_29@t,
	fromRegsPort_sig_reg_file_30_at_t = fromRegsPort_sig_reg_file_30@t,
	fromRegsPort_sig_reg_file_31_at_t = fromRegsPort_sig_reg_file_31@t,
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t;
assume: 
	 at t: fetch_17(false);
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_R));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_B));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_S));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_U));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_J));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_I_I));
	 at t: (getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_I_L);
	 at t: fromMemoryPort_sync;
prove:
	 at t_end: execute_11(true);
	 at t_end: memoryAccess_addrIn(true) = getALUresult(ALU_ADD,readRegfile(fromRegsPort_sig_reg_file_01_at_t,fromRegsPort_sig_reg_file_02_at_t,fromRegsPort_sig_reg_file_03_at_t,fromRegsPort_sig_reg_file_04_at_t,fromRegsPort_sig_reg_file_05_at_t,fromRegsPort_sig_reg_file_06_at_t,fromRegsPort_sig_reg_file_07_at_t,fromRegsPort_sig_reg_file_08_at_t,fromRegsPort_sig_reg_file_09_at_t,fromRegsPort_sig_reg_file_10_at_t,fromRegsPort_sig_reg_file_11_at_t,fromRegsPort_sig_reg_file_12_at_t,fromRegsPort_sig_reg_file_13_at_t,fromRegsPort_sig_reg_file_14_at_t,fromRegsPort_sig_reg_file_15_at_t,fromRegsPort_sig_reg_file_16_at_t,fromRegsPort_sig_reg_file_17_at_t,fromRegsPort_sig_reg_file_18_at_t,fromRegsPort_sig_reg_file_19_at_t,fromRegsPort_sig_reg_file_20_at_t,fromRegsPort_sig_reg_file_21_at_t,fromRegsPort_sig_reg_file_22_at_t,fromRegsPort_sig_reg_file_23_at_t,fromRegsPort_sig_reg_file_24_at_t,fromRegsPort_sig_reg_file_25_at_t,fromRegsPort_sig_reg_file_26_at_t,fromRegsPort_sig_reg_file_27_at_t,fromRegsPort_sig_reg_file_28_at_t,fromRegsPort_sig_reg_file_29_at_t,fromRegsPort_sig_reg_file_30_at_t,fromRegsPort_sig_reg_file_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t))),getImmediate(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t)));
	 at t_end: memoryAccess_dataIn(true) = 0;
	 at t_end: memoryAccess_mask(true) = getMemoryMask(getInstrType(getFunct3(fromMemoryPort_sig_loadedData_at_t),getFunct7(fromMemoryPort_sig_loadedData_at_t),getOpcode(fromMemoryPort_sig_loadedData_at_t)));
	 at t_end: memoryAccess_req(true) = ME_RD;
	 at t_end: pcReg(true) = pcReg_at_t;
	 at t_end: regfileWrite_dst(true) = getRdAddr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t));
	 at t_end: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 at t_end: toMemoryPort_sig_addrIn = getALUresult(ALU_ADD,readRegfile(fromRegsPort_sig_reg_file_01_at_t,fromRegsPort_sig_reg_file_02_at_t,fromRegsPort_sig_reg_file_03_at_t,fromRegsPort_sig_reg_file_04_at_t,fromRegsPort_sig_reg_file_05_at_t,fromRegsPort_sig_reg_file_06_at_t,fromRegsPort_sig_reg_file_07_at_t,fromRegsPort_sig_reg_file_08_at_t,fromRegsPort_sig_reg_file_09_at_t,fromRegsPort_sig_reg_file_10_at_t,fromRegsPort_sig_reg_file_11_at_t,fromRegsPort_sig_reg_file_12_at_t,fromRegsPort_sig_reg_file_13_at_t,fromRegsPort_sig_reg_file_14_at_t,fromRegsPort_sig_reg_file_15_at_t,fromRegsPort_sig_reg_file_16_at_t,fromRegsPort_sig_reg_file_17_at_t,fromRegsPort_sig_reg_file_18_at_t,fromRegsPort_sig_reg_file_19_at_t,fromRegsPort_sig_reg_file_20_at_t,fromRegsPort_sig_reg_file_21_at_t,fromRegsPort_sig_reg_file_22_at_t,fromRegsPort_sig_reg_file_23_at_t,fromRegsPort_sig_reg_file_24_at_t,fromRegsPort_sig_reg_file_25_at_t,fromRegsPort_sig_reg_file_26_at_t,fromRegsPort_sig_reg_file_27_at_t,fromRegsPort_sig_reg_file_28_at_t,fromRegsPort_sig_reg_file_29_at_t,fromRegsPort_sig_reg_file_30_at_t,fromRegsPort_sig_reg_file_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t))),getImmediate(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t)));
	 at t_end: toMemoryPort_sig_dataIn = 0;
	 at t_end: toMemoryPort_sig_mask = getMemoryMask(getInstrType(getFunct3(fromMemoryPort_sig_loadedData_at_t),getFunct7(fromMemoryPort_sig_loadedData_at_t),getOpcode(fromMemoryPort_sig_loadedData_at_t)));
	 at t_end: toMemoryPort_sig_req = ME_RD;
	 during[t+1, t_end]: fromMemoryPort_notify = false;
	 during[t+1, t_end-1]: toMemoryPort_notify = false;
	 at t_end: toMemoryPort_notify = true;
	 during[t+1, t_end]: toRegsPort_notify = false;
right_hook:    t+1;
end property;

property fetch_17_read_13 is
dependencies: no_reset,no_wait;
for timepoints:
	 t_end = t+1;
freeze:
	fromMemoryPort_sig_loadedData_at_t = fromMemoryPort_sig_loadedData@t,
	fromRegsPort_sig_reg_file_01_at_t = fromRegsPort_sig_reg_file_01@t,
	fromRegsPort_sig_reg_file_02_at_t = fromRegsPort_sig_reg_file_02@t,
	fromRegsPort_sig_reg_file_03_at_t = fromRegsPort_sig_reg_file_03@t,
	fromRegsPort_sig_reg_file_04_at_t = fromRegsPort_sig_reg_file_04@t,
	fromRegsPort_sig_reg_file_05_at_t = fromRegsPort_sig_reg_file_05@t,
	fromRegsPort_sig_reg_file_06_at_t = fromRegsPort_sig_reg_file_06@t,
	fromRegsPort_sig_reg_file_07_at_t = fromRegsPort_sig_reg_file_07@t,
	fromRegsPort_sig_reg_file_08_at_t = fromRegsPort_sig_reg_file_08@t,
	fromRegsPort_sig_reg_file_09_at_t = fromRegsPort_sig_reg_file_09@t,
	fromRegsPort_sig_reg_file_10_at_t = fromRegsPort_sig_reg_file_10@t,
	fromRegsPort_sig_reg_file_11_at_t = fromRegsPort_sig_reg_file_11@t,
	fromRegsPort_sig_reg_file_12_at_t = fromRegsPort_sig_reg_file_12@t,
	fromRegsPort_sig_reg_file_13_at_t = fromRegsPort_sig_reg_file_13@t,
	fromRegsPort_sig_reg_file_14_at_t = fromRegsPort_sig_reg_file_14@t,
	fromRegsPort_sig_reg_file_15_at_t = fromRegsPort_sig_reg_file_15@t,
	fromRegsPort_sig_reg_file_16_at_t = fromRegsPort_sig_reg_file_16@t,
	fromRegsPort_sig_reg_file_17_at_t = fromRegsPort_sig_reg_file_17@t,
	fromRegsPort_sig_reg_file_18_at_t = fromRegsPort_sig_reg_file_18@t,
	fromRegsPort_sig_reg_file_19_at_t = fromRegsPort_sig_reg_file_19@t,
	fromRegsPort_sig_reg_file_20_at_t = fromRegsPort_sig_reg_file_20@t,
	fromRegsPort_sig_reg_file_21_at_t = fromRegsPort_sig_reg_file_21@t,
	fromRegsPort_sig_reg_file_22_at_t = fromRegsPort_sig_reg_file_22@t,
	fromRegsPort_sig_reg_file_23_at_t = fromRegsPort_sig_reg_file_23@t,
	fromRegsPort_sig_reg_file_24_at_t = fromRegsPort_sig_reg_file_24@t,
	fromRegsPort_sig_reg_file_25_at_t = fromRegsPort_sig_reg_file_25@t,
	fromRegsPort_sig_reg_file_26_at_t = fromRegsPort_sig_reg_file_26@t,
	fromRegsPort_sig_reg_file_27_at_t = fromRegsPort_sig_reg_file_27@t,
	fromRegsPort_sig_reg_file_28_at_t = fromRegsPort_sig_reg_file_28@t,
	fromRegsPort_sig_reg_file_29_at_t = fromRegsPort_sig_reg_file_29@t,
	fromRegsPort_sig_reg_file_30_at_t = fromRegsPort_sig_reg_file_30@t,
	fromRegsPort_sig_reg_file_31_at_t = fromRegsPort_sig_reg_file_31@t,
	pcReg_at_t = pcReg(false)@t;
assume: 
	 at t: fetch_17(false);
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_R));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_B));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_S));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_U));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_J));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_I_I));
	 at t: not((getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_I_L));
	 at t: (getEncType(getOpcode(fromMemoryPort_sig_loadedData)) = ENC_I_J);
	 at t: fromMemoryPort_sync;
prove:
	 at t_end: fetch_16(true);
	 at t_end: memoryAccess_addrIn(true) = (readRegfile(fromRegsPort_sig_reg_file_01_at_t,fromRegsPort_sig_reg_file_02_at_t,fromRegsPort_sig_reg_file_03_at_t,fromRegsPort_sig_reg_file_04_at_t,fromRegsPort_sig_reg_file_05_at_t,fromRegsPort_sig_reg_file_06_at_t,fromRegsPort_sig_reg_file_07_at_t,fromRegsPort_sig_reg_file_08_at_t,fromRegsPort_sig_reg_file_09_at_t,fromRegsPort_sig_reg_file_10_at_t,fromRegsPort_sig_reg_file_11_at_t,fromRegsPort_sig_reg_file_12_at_t,fromRegsPort_sig_reg_file_13_at_t,fromRegsPort_sig_reg_file_14_at_t,fromRegsPort_sig_reg_file_15_at_t,fromRegsPort_sig_reg_file_16_at_t,fromRegsPort_sig_reg_file_17_at_t,fromRegsPort_sig_reg_file_18_at_t,fromRegsPort_sig_reg_file_19_at_t,fromRegsPort_sig_reg_file_20_at_t,fromRegsPort_sig_reg_file_21_at_t,fromRegsPort_sig_reg_file_22_at_t,fromRegsPort_sig_reg_file_23_at_t,fromRegsPort_sig_reg_file_24_at_t,fromRegsPort_sig_reg_file_25_at_t,fromRegsPort_sig_reg_file_26_at_t,fromRegsPort_sig_reg_file_27_at_t,fromRegsPort_sig_reg_file_28_at_t,fromRegsPort_sig_reg_file_29_at_t,fromRegsPort_sig_reg_file_30_at_t,fromRegsPort_sig_reg_file_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t))) + getImmediate(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t)))(31 downto 0);
	 at t_end: memoryAccess_dataIn(true) = 0;
	 at t_end: memoryAccess_mask(true) = MT_W;
	 at t_end: memoryAccess_req(true) = ME_RD;
	 at t_end: pcReg(true) = (readRegfile(fromRegsPort_sig_reg_file_01_at_t,fromRegsPort_sig_reg_file_02_at_t,fromRegsPort_sig_reg_file_03_at_t,fromRegsPort_sig_reg_file_04_at_t,fromRegsPort_sig_reg_file_05_at_t,fromRegsPort_sig_reg_file_06_at_t,fromRegsPort_sig_reg_file_07_at_t,fromRegsPort_sig_reg_file_08_at_t,fromRegsPort_sig_reg_file_09_at_t,fromRegsPort_sig_reg_file_10_at_t,fromRegsPort_sig_reg_file_11_at_t,fromRegsPort_sig_reg_file_12_at_t,fromRegsPort_sig_reg_file_13_at_t,fromRegsPort_sig_reg_file_14_at_t,fromRegsPort_sig_reg_file_15_at_t,fromRegsPort_sig_reg_file_16_at_t,fromRegsPort_sig_reg_file_17_at_t,fromRegsPort_sig_reg_file_18_at_t,fromRegsPort_sig_reg_file_19_at_t,fromRegsPort_sig_reg_file_20_at_t,fromRegsPort_sig_reg_file_21_at_t,fromRegsPort_sig_reg_file_22_at_t,fromRegsPort_sig_reg_file_23_at_t,fromRegsPort_sig_reg_file_24_at_t,fromRegsPort_sig_reg_file_25_at_t,fromRegsPort_sig_reg_file_26_at_t,fromRegsPort_sig_reg_file_27_at_t,fromRegsPort_sig_reg_file_28_at_t,fromRegsPort_sig_reg_file_29_at_t,fromRegsPort_sig_reg_file_30_at_t,fromRegsPort_sig_reg_file_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t))) + getImmediate(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t)))(31 downto 0);
	 at t_end: regfileWrite_dst(true) = getRdAddr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t));
	 at t_end: regfileWrite_dstData(true) = (4 + pcReg_at_t)(31 downto 0);
	 at t_end: toMemoryPort_sig_addrIn = (readRegfile(fromRegsPort_sig_reg_file_01_at_t,fromRegsPort_sig_reg_file_02_at_t,fromRegsPort_sig_reg_file_03_at_t,fromRegsPort_sig_reg_file_04_at_t,fromRegsPort_sig_reg_file_05_at_t,fromRegsPort_sig_reg_file_06_at_t,fromRegsPort_sig_reg_file_07_at_t,fromRegsPort_sig_reg_file_08_at_t,fromRegsPort_sig_reg_file_09_at_t,fromRegsPort_sig_reg_file_10_at_t,fromRegsPort_sig_reg_file_11_at_t,fromRegsPort_sig_reg_file_12_at_t,fromRegsPort_sig_reg_file_13_at_t,fromRegsPort_sig_reg_file_14_at_t,fromRegsPort_sig_reg_file_15_at_t,fromRegsPort_sig_reg_file_16_at_t,fromRegsPort_sig_reg_file_17_at_t,fromRegsPort_sig_reg_file_18_at_t,fromRegsPort_sig_reg_file_19_at_t,fromRegsPort_sig_reg_file_20_at_t,fromRegsPort_sig_reg_file_21_at_t,fromRegsPort_sig_reg_file_22_at_t,fromRegsPort_sig_reg_file_23_at_t,fromRegsPort_sig_reg_file_24_at_t,fromRegsPort_sig_reg_file_25_at_t,fromRegsPort_sig_reg_file_26_at_t,fromRegsPort_sig_reg_file_27_at_t,fromRegsPort_sig_reg_file_28_at_t,fromRegsPort_sig_reg_file_29_at_t,fromRegsPort_sig_reg_file_30_at_t,fromRegsPort_sig_reg_file_31_at_t,getRs1Addr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t))) + getImmediate(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t)))(31 downto 0);
	 at t_end: toMemoryPort_sig_dataIn = 0;
	 at t_end: toMemoryPort_sig_mask = MT_W;
	 at t_end: toMemoryPort_sig_req = ME_RD;
	 at t_end: toRegsPort_sig_dst = getRdAddr(fromMemoryPort_sig_loadedData_at_t,getOpcode(fromMemoryPort_sig_loadedData_at_t));
	 at t_end: toRegsPort_sig_dstData = (4 + pcReg_at_t)(31 downto 0);
	 during[t+1, t_end]: fromMemoryPort_notify = false;
	 during[t+1, t_end-1]: toMemoryPort_notify = false;
	 at t_end: toMemoryPort_notify = true;
	 during[t+1, t_end-1]: toRegsPort_notify = false;
	 at t_end: toRegsPort_notify = true;
end property;

property wait_execute_4 is
dependencies: no_reset,no_wait;
freeze:
	memoryAccess_addrIn_at_t = memoryAccess_addrIn(false)@t,
	memoryAccess_dataIn_at_t = memoryAccess_dataIn(false)@t,
	memoryAccess_mask_at_t = memoryAccess_mask(false)@t,
	memoryAccess_req_at_t = memoryAccess_req(false)@t,
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: execute_4(false);
	 at t: not(toMemoryPort_sync);
prove:
	 at t+1: execute_4(true);
	 at t+1: memoryAccess_addrIn(true) = memoryAccess_addrIn_at_t;
	 at t+1: memoryAccess_dataIn(true) = memoryAccess_dataIn_at_t;
	 at t+1: memoryAccess_mask(true) = memoryAccess_mask_at_t;
	 at t+1: memoryAccess_req(true) = memoryAccess_req_at_t;
	 at t+1: pcReg(true) = pcReg_at_t;
	 at t+1: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t+1: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 at t+1: toMemoryPort_sig_addrIn = memoryAccess_addrIn_at_t;
	 at t+1: toMemoryPort_sig_dataIn = memoryAccess_dataIn_at_t;
	 at t+1: toMemoryPort_sig_mask = memoryAccess_mask_at_t;
	 at t+1: toMemoryPort_sig_req = memoryAccess_req_at_t;
	 at t+1: fromMemoryPort_notify = false;
	 at t+1: toMemoryPort_notify = true;
	 at t+1: toRegsPort_notify = false;
right_hook:    t+1;
end property;

property wait_execute_5 is
dependencies: no_reset,no_wait;
freeze:
	memoryAccess_addrIn_at_t = memoryAccess_addrIn(false)@t,
	memoryAccess_dataIn_at_t = memoryAccess_dataIn(false)@t,
	memoryAccess_mask_at_t = memoryAccess_mask(false)@t,
	memoryAccess_req_at_t = memoryAccess_req(false)@t,
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: execute_5(false);
	 at t: not(fromMemoryPort_sync);
prove:
	 at t+1: execute_5(true);
	 at t+1: memoryAccess_addrIn(true) = memoryAccess_addrIn_at_t;
	 at t+1: memoryAccess_dataIn(true) = memoryAccess_dataIn_at_t;
	 at t+1: memoryAccess_mask(true) = memoryAccess_mask_at_t;
	 at t+1: memoryAccess_req(true) = memoryAccess_req_at_t;
	 at t+1: pcReg(true) = pcReg_at_t;
	 at t+1: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t+1: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 at t+1: fromMemoryPort_notify = true;
	 at t+1: toMemoryPort_notify = false;
	 at t+1: toRegsPort_notify = false;
right_hook:    t+1;
end property;

property wait_execute_11 is
dependencies: no_reset,no_wait;
freeze:
	memoryAccess_addrIn_at_t = memoryAccess_addrIn(false)@t,
	memoryAccess_dataIn_at_t = memoryAccess_dataIn(false)@t,
	memoryAccess_mask_at_t = memoryAccess_mask(false)@t,
	memoryAccess_req_at_t = memoryAccess_req(false)@t,
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: execute_11(false);
	 at t: not(toMemoryPort_sync);
prove:
	 at t+1: execute_11(true);
	 at t+1: memoryAccess_addrIn(true) = memoryAccess_addrIn_at_t;
	 at t+1: memoryAccess_dataIn(true) = memoryAccess_dataIn_at_t;
	 at t+1: memoryAccess_mask(true) = memoryAccess_mask_at_t;
	 at t+1: memoryAccess_req(true) = memoryAccess_req_at_t;
	 at t+1: pcReg(true) = pcReg_at_t;
	 at t+1: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t+1: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 at t+1: toMemoryPort_sig_addrIn = memoryAccess_addrIn_at_t;
	 at t+1: toMemoryPort_sig_dataIn = memoryAccess_dataIn_at_t;
	 at t+1: toMemoryPort_sig_mask = memoryAccess_mask_at_t;
	 at t+1: toMemoryPort_sig_req = memoryAccess_req_at_t;
	 at t+1: fromMemoryPort_notify = false;
	 at t+1: toMemoryPort_notify = true;
	 at t+1: toRegsPort_notify = false;
right_hook:    t+1;
end property;

property wait_execute_12 is
dependencies: no_reset,no_wait;
freeze:
	memoryAccess_addrIn_at_t = memoryAccess_addrIn(false)@t,
	memoryAccess_dataIn_at_t = memoryAccess_dataIn(false)@t,
	memoryAccess_mask_at_t = memoryAccess_mask(false)@t,
	memoryAccess_req_at_t = memoryAccess_req(false)@t,
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: execute_12(false);
	 at t: not(fromMemoryPort_sync);
prove:
	 at t+1: execute_12(true);
	 at t+1: memoryAccess_addrIn(true) = memoryAccess_addrIn_at_t;
	 at t+1: memoryAccess_dataIn(true) = memoryAccess_dataIn_at_t;
	 at t+1: memoryAccess_mask(true) = memoryAccess_mask_at_t;
	 at t+1: memoryAccess_req(true) = memoryAccess_req_at_t;
	 at t+1: pcReg(true) = pcReg_at_t;
	 at t+1: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t+1: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 at t+1: fromMemoryPort_notify = true;
	 at t+1: toMemoryPort_notify = false;
	 at t+1: toRegsPort_notify = false;
right_hook:    t+1;
end property;

property wait_fetch_16 is
dependencies: no_reset,no_wait;
freeze:
	memoryAccess_addrIn_at_t = memoryAccess_addrIn(false)@t,
	memoryAccess_dataIn_at_t = memoryAccess_dataIn(false)@t,
	memoryAccess_mask_at_t = memoryAccess_mask(false)@t,
	memoryAccess_req_at_t = memoryAccess_req(false)@t,
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: fetch_16(false);
	 at t: not(toMemoryPort_sync);
prove:
	 at t+1: fetch_16(true);
	 at t+1: memoryAccess_addrIn(true) = memoryAccess_addrIn_at_t;
	 at t+1: memoryAccess_dataIn(true) = memoryAccess_dataIn_at_t;
	 at t+1: memoryAccess_mask(true) = memoryAccess_mask_at_t;
	 at t+1: memoryAccess_req(true) = memoryAccess_req_at_t;
	 at t+1: pcReg(true) = pcReg_at_t;
	 at t+1: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t+1: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 at t+1: toMemoryPort_sig_addrIn = memoryAccess_addrIn_at_t;
	 at t+1: toMemoryPort_sig_dataIn = memoryAccess_dataIn_at_t;
	 at t+1: toMemoryPort_sig_mask = memoryAccess_mask_at_t;
	 at t+1: toMemoryPort_sig_req = memoryAccess_req_at_t;
	 at t+1: fromMemoryPort_notify = false;
	 at t+1: toMemoryPort_notify = true;
	 at t+1: toRegsPort_notify = false;
right_hook:    t+1;
end property;

property wait_fetch_17 is
dependencies: no_reset,no_wait;
freeze:
	memoryAccess_addrIn_at_t = memoryAccess_addrIn(false)@t,
	memoryAccess_dataIn_at_t = memoryAccess_dataIn(false)@t,
	memoryAccess_mask_at_t = memoryAccess_mask(false)@t,
	memoryAccess_req_at_t = memoryAccess_req(false)@t,
	pcReg_at_t = pcReg(false)@t,
	regfileWrite_dstData_at_t = regfileWrite_dstData(false)@t,
	regfileWrite_dst_at_t = regfileWrite_dst(false)@t;
assume: 
	 at t: fetch_17(false);
	 at t: not(fromMemoryPort_sync);
prove:
	 at t+1: fetch_17(true);
	 at t+1: memoryAccess_addrIn(true) = memoryAccess_addrIn_at_t;
	 at t+1: memoryAccess_dataIn(true) = memoryAccess_dataIn_at_t;
	 at t+1: memoryAccess_mask(true) = memoryAccess_mask_at_t;
	 at t+1: memoryAccess_req(true) = memoryAccess_req_at_t;
	 at t+1: pcReg(true) = pcReg_at_t;
	 at t+1: regfileWrite_dst(true) = regfileWrite_dst_at_t;
	 at t+1: regfileWrite_dstData(true) = regfileWrite_dstData_at_t;
	 at t+1: fromMemoryPort_notify = true;
	 at t+1: toMemoryPort_notify = false;
	 at t+1: toRegsPort_notify = false;
right_hook:    t+1;
end property;