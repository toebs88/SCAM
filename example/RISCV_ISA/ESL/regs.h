#ifndef RISCV_REGS_H_
#define RISCV_REGS_H_

#include "systemc.h"
#include <iomanip>
#include "Interfaces.h"
#include "CPU_Interfaces.h"


class Regs : public sc_module {
public:

    //Constructor
    SC_HAS_PROCESS(Regs);

    Regs(sc_module_name name) :
            toRegsPort("regsInPort"),
            fromRegsPort("regsOutPort"),
            reg_file_01(0),
            reg_file_02(0),
            reg_file_03(0),
            reg_file_04(0),
            reg_file_05(0),
            reg_file_06(0),
            reg_file_07(0),
            reg_file_08(0),
            reg_file_09(0),
            reg_file_10(0),
            reg_file_11(0),
            reg_file_12(0),
            reg_file_13(0),
            reg_file_14(0),
            reg_file_15(0),
            reg_file_16(0),
            reg_file_17(0),
            reg_file_18(0),
            reg_file_19(0),
            reg_file_20(0),
            reg_file_21(0),
            reg_file_22(0),
            reg_file_23(0),
            reg_file_24(0),
            reg_file_25(0),
            reg_file_26(0),
            reg_file_27(0),
            reg_file_28(0),
            reg_file_29(0),
            reg_file_30(0),
            reg_file_31(0),
            rec(false)
    {
        SC_THREAD(run);
    }

    slave_in<RegfileWriteType> toRegsPort;
    slave_out<RegfileType> fromRegsPort;

    RegfileWriteType regfileWrite;
    RegfileType regfile; // RegisterFile

    // register file data
    unsigned int reg_file_01 = 0;
    unsigned int reg_file_02 = 0;
    unsigned int reg_file_03 = 0;
    unsigned int reg_file_04 = 0;
    unsigned int reg_file_05 = 0;
    unsigned int reg_file_06 = 0;
    unsigned int reg_file_07 = 0;
    unsigned int reg_file_08 = 0;
    unsigned int reg_file_09 = 0;
    unsigned int reg_file_10 = 0;
    unsigned int reg_file_11 = 0;
    unsigned int reg_file_12 = 0;
    unsigned int reg_file_13 = 0;
    unsigned int reg_file_14 = 0;
    unsigned int reg_file_15 = 0;
    unsigned int reg_file_16 = 0;
    unsigned int reg_file_17 = 0;
    unsigned int reg_file_18 = 0;
    unsigned int reg_file_19 = 0;
    unsigned int reg_file_20 = 0;
    unsigned int reg_file_21 = 0;
    unsigned int reg_file_22 = 0;
    unsigned int reg_file_23 = 0;
    unsigned int reg_file_24 = 0;
    unsigned int reg_file_25 = 0;
    unsigned int reg_file_26 = 0;
    unsigned int reg_file_27 = 0;
    unsigned int reg_file_28 = 0;
    unsigned int reg_file_29 = 0;
    unsigned int reg_file_30 = 0;
    unsigned int reg_file_31 = 0;

    bool rec;

    void run(); // thread

    void log(); // log reg file
};


void Regs::run() {

    while (true) {

        // return current data
        regfile.reg_file_01 = reg_file_01;
        regfile.reg_file_02 = reg_file_02;
        regfile.reg_file_03 = reg_file_03;
        regfile.reg_file_04 = reg_file_04;
        regfile.reg_file_05 = reg_file_05;
        regfile.reg_file_06 = reg_file_06;
        regfile.reg_file_07 = reg_file_07;
        regfile.reg_file_08 = reg_file_08;
        regfile.reg_file_09 = reg_file_09;
        regfile.reg_file_10 = reg_file_10;
        regfile.reg_file_11 = reg_file_11;
        regfile.reg_file_12 = reg_file_12;
        regfile.reg_file_13 = reg_file_13;
        regfile.reg_file_14 = reg_file_14;
        regfile.reg_file_15 = reg_file_15;
        regfile.reg_file_16 = reg_file_16;
        regfile.reg_file_17 = reg_file_17;
        regfile.reg_file_18 = reg_file_18;
        regfile.reg_file_19 = reg_file_19;
        regfile.reg_file_20 = reg_file_20;
        regfile.reg_file_21 = reg_file_21;
        regfile.reg_file_22 = reg_file_22;
        regfile.reg_file_23 = reg_file_23;
        regfile.reg_file_24 = reg_file_24;
        regfile.reg_file_25 = reg_file_25;
        regfile.reg_file_26 = reg_file_26;
        regfile.reg_file_27 = reg_file_27;
        regfile.reg_file_28 = reg_file_28;
        regfile.reg_file_29 = reg_file_29;
        regfile.reg_file_30 = reg_file_30;
        regfile.reg_file_31 = reg_file_31;

        fromRegsPort->nb_write(regfile);

        rec = toRegsPort->nb_read(regfileWrite); // read request

        if (rec) {

            if (regfileWrite.dst != 0) {

                // write to regfile
                if (regfileWrite.dst == 1) {
                    reg_file_01 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 2) {
                    reg_file_02 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 3) {
                    reg_file_03 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 4) {
                    reg_file_04 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 5) {
                    reg_file_05 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 6) {
                    reg_file_06 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 7) {
                    reg_file_07 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 8) {
                    reg_file_08 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 9) {
                    reg_file_09 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 10) {
                    reg_file_10 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 11) {
                    reg_file_11 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 12) {
                    reg_file_12 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 13) {
                    reg_file_13 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 14) {
                    reg_file_14 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 15) {
                    reg_file_15 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 16) {
                    reg_file_16 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 17) {
                    reg_file_17 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 18) {
                    reg_file_18 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 19) {
                    reg_file_19 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 20) {
                    reg_file_20 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 21) {
                    reg_file_21 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 22) {
                    reg_file_22 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 23) {
                    reg_file_23 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 24) {
                    reg_file_24 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 25) {
                    reg_file_25 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 26) {
                    reg_file_26 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 27) {
                    reg_file_27 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 28) {
                    reg_file_28 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 29) {
                    reg_file_29 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 30) {
                    reg_file_30 = regfileWrite.dstData;
                } else {
                    reg_file_31 = regfileWrite.dstData;
                }
            }

#ifdef LOGTOFILE
            cout << "S5: @RF: Writing to register x" << dec << regfileWrite.dst << " = 0x" << hex
                 << regfileWrite.dstData << " = " << dec << regfileWrite.dstData << "(dec)" << endl;
            log();  // print regfile
#endif
        }
    }
}


void Regs::log() {

    stringstream s;

    cout << string(143, '-') << endl;

    cout << "Register File Content (Hex):" << endl;

    cout << string(143, '-') << endl;

    for (int i = 0; i < 32; i++) {
        switch (i) {
            case 0:
                s << dec << "RF[00] 0x0";
                break;
            case 1:
                s << dec << "RF[0" << i << "] 0x" << hex << reg_file_01;
                break;
            case 2:
                s << dec << "RF[0" << i << "] 0x" << hex << reg_file_02;
                break;
            case 3:
                s << dec << "RF[0" << i << "] 0x" << hex << reg_file_03;
                break;
            case 4:
                s << dec << "RF[0" << i << "] 0x" << hex << reg_file_04;
                break;
            case 5:
                s << dec << "RF[0" << i << "] 0x" << hex << reg_file_05;
                break;
            case 6:
                s << dec << "RF[0" << i << "] 0x" << hex << reg_file_06;
                break;
            case 7:
                s << dec << "RF[0" << i << "] 0x" << hex << reg_file_07 << endl;
                break;
            case 8:
                s << dec << "RF[0" << i << "] 0x" << hex << reg_file_08;
                break;
            case 9:
                s << dec << "RF[0" << i << "] 0x" << hex << reg_file_09;
                break;
            case 10:
                s << dec << "RF[" << i << "] 0x" << hex << reg_file_10;
                break;
            case 11:
                s << dec << "RF[" << i << "] 0x" << hex << reg_file_11;
                break;
            case 12:
                s << dec << "RF[" << i << "] 0x" << hex << reg_file_12;
                break;
            case 13:
                s << dec << "RF[" << i << "] 0x" << hex << reg_file_13;
                break;
            case 14:
                s << dec << "RF[" << i << "] 0x" << hex << reg_file_14;
                break;
            case 15:
                s << dec << "RF[" << i << "] 0x" << hex << reg_file_15 << endl;
                break;
            case 16:
                s << dec << "RF[" << i << "] 0x" << hex << reg_file_16;
                break;
            case 17:
                s << dec << "RF[" << i << "] 0x" << hex << reg_file_17;
                break;
            case 18:
                s << dec << "RF[" << i << "] 0x" << hex << reg_file_18;
                break;
            case 19:
                s << dec << "RF[" << i << "] 0x" << hex << reg_file_19;
                break;
            case 20:
                s << dec << "RF[" << i << "] 0x" << hex << reg_file_20;
                break;
            case 21:
                s << dec << "RF[" << i << "] 0x" << hex << reg_file_21;
                break;
            case 22:
                s << dec << "RF[" << i << "] 0x" << hex << reg_file_22;
                break;
            case 23:
                s << dec << "RF[" << i << "] 0x" << hex << reg_file_23 << endl;
                break;
            case 24:
                s << dec << "RF[" << i << "] 0x" << hex << reg_file_24;
                break;
            case 25:
                s << dec << "RF[" << i << "] 0x" << hex << reg_file_25;
                break;
            case 26:
                s << dec << "RF[" << i << "] 0x" << hex << reg_file_26;
                break;
            case 27:
                s << dec << "RF[" << i << "] 0x" << hex << reg_file_27;
                break;
            case 28:
                s << dec << "RF[" << i << "] 0x" << hex << reg_file_28;
                break;
            case 29:
                s << dec << "RF[" << i << "] 0x" << hex << reg_file_29;
                break;
            case 30:
                s << dec << "RF[" << i << "] 0x" << hex << reg_file_30;
                break;
            case 31:
                s << dec << "RF[" << i << "] 0x" << hex << reg_file_31 << endl;
                break;
            default:
                s << "Error!";
        }

        if (i == 7 || i == 15 || i == 23 || i == 31) {
            cout << left  << s.str();
        } else {
            cout << left << setw(18) << s.str();
        }

        s.str("");
    }

    cout << string(143, '-') << endl;

    cout << "Register File Content (Dec):" << endl;

    cout << string(143, '-') << endl;

    for (int i = 0; i < 32; i++) {
        switch (i) {
            case 0:
                s << dec << "RF[00]   0";
                break;
            case 1:
                s << dec << "RF[0" << i << "]   " << reg_file_01;
                break;
            case 2:
                s << dec << "RF[0" << i << "]   " << reg_file_02;
                break;
            case 3:
                s << dec << "RF[0" << i << "]   " << reg_file_03;
                break;
            case 4:
                s << dec << "RF[0" << i << "]   " << reg_file_04;
                break;
            case 5:
                s << dec << "RF[0" << i << "]   " << reg_file_05;
                break;
            case 6:
                s << dec << "RF[0" << i << "]   " << reg_file_06;
                break;
            case 7:
                s << dec << "RF[0" << i << "]   " << reg_file_07 << endl;
                break;
            case 8:
                s << dec << "RF[0" << i << "]   " << reg_file_08;
                break;
            case 9:
                s << dec << "RF[0" << i << "]   " << reg_file_09;
                break;
            case 10:
                s << dec << "RF[" << i << "]   " << reg_file_10;
                break;
            case 11:
                s << dec << "RF[" << i << "]   " << reg_file_11;
                break;
            case 12:
                s << dec << "RF[" << i << "]   " << reg_file_12;
                break;
            case 13:
                s << dec << "RF[" << i << "]   " << reg_file_13;
                break;
            case 14:
                s << dec << "RF[" << i << "]   " << reg_file_14;
                break;
            case 15:
                s << dec << "RF[" << i << "]   " << reg_file_15 << endl;
                break;
            case 16:
                s << dec << "RF[" << i << "]   " << reg_file_16;
                break;
            case 17:
                s << dec << "RF[" << i << "]   " << reg_file_17;
                break;
            case 18:
                s << dec << "RF[" << i << "]   " << reg_file_18;
                break;
            case 19:
                s << dec << "RF[" << i << "]   " << reg_file_19;
                break;
            case 20:
                s << dec << "RF[" << i << "]   " << reg_file_20;
                break;
            case 21:
                s << dec << "RF[" << i << "]   " << reg_file_21;
                break;
            case 22:
                s << dec << "RF[" << i << "]   " << reg_file_22;
                break;
            case 23:
                s << dec << "RF[" << i << "]   " << reg_file_23 << endl;
                break;
            case 24:
                s << dec << "RF[" << i << "]   " << reg_file_24;
                break;
            case 25:
                s << dec << "RF[" << i << "]   " << reg_file_25;
                break;
            case 26:
                s << dec << "RF[" << i << "]   " << reg_file_26;
                break;
            case 27:
                s << dec << "RF[" << i << "]   " << reg_file_27;
                break;
            case 28:
                s << dec << "RF[" << i << "]   " << reg_file_28;
                break;
            case 29:
                s << dec << "RF[" << i << "]   " << reg_file_29;
                break;
            case 30:
                s << dec << "RF[" << i << "]   " << reg_file_30;
                break;
            case 31:
                s << dec << "RF[" << i << "]   " << reg_file_31 << endl;
                break;
            default:
                s << "Error!";
        }

        if (i == 7 || i == 15 || i == 23 || i == 31) {
            cout << left  << s.str();
        } else {
            cout << left << setw(18) << s.str();
        }

        s.str("");
    }

    cout << string(143, '-') << endl;
}

#endif  // RISCV_REGS_H_